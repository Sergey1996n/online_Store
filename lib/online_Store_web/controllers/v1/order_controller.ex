defmodule Online_StoreWeb.V1.OrderController do
  use Online_StoreWeb, :controller

  alias Online_Store.Orders
  alias Online_Store.Baskets
  alias Online_Store.Repo
  alias Online_Store.Accounts

  action_fallback(Online_StoreWeb.FallbackController)

  def create(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, basket} <- Baskets.get_basket_user(current_user.id),
         {:ok, order} <-
           Orders.create_order(%{user_id: current_user.id, products: basket.products}),
         {:ok, _basket} <- Baskets.clear_products(basket),
         {:ok, store} <- Accounts.get_user(id),
         {:ok, _value} <-
           Repo.transaction(fn repo ->
             with {:ok, _} <-
                    Accounts.update_user(current_user, %{
                      balance: current_user.balance - order.sum_price
                    }),
                  {:ok, _} <-
                    Accounts.update_user(store, %{
                      balance: store.balance + order.sum_price
                    }) do
               {:ok, "qwe"}
             else
               {:error, _} ->
                 repo.rollback(:failed_transfer)
             end
           end) do
      conn
      |> put_status(:created)
      |> render("create.json", %{order: order})
    end
  end
end
