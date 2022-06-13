defmodule Online_StoreWeb.V1.BasketController do
  use Online_StoreWeb, :controller

  alias Online_Store.Baskets
  alias Online_Store.Products
  alias Online_Store.Orders
  alias Online_StoreWeb.ApplyParams

  action_fallback(Online_StoreWeb.FallbackController)

  defmodule ShowBasketParams do
    use Params.Schema, %{
      order: :integer,
      page!: :integer,
      page_size!: :integer
    }
  end

  def show(conn, %{"current_user" => current_user} = params) do
    with {:ok, params} <- ApplyParams.do_apply(ShowBasketParams, params),
         {:ok, basket} <- Baskets.get_basket_user(current_user.id) do
      page = Products.list_products_basket(basket.id, params)
      render(conn, "index_product.json", %{page: page})
    end
  end

  def update(conn, %{"current_user" => current_user} = params) do
    with {:ok, basket} <- Baskets.get_basket_user(current_user.id),
         {:ok, product} <- Products.get_product(params["product_id"]) do
      case Products.get_product_in_basket(basket.id, product.id) do
        {:ok, _product} -> Baskets.delete_product(basket, %{products: product})
        {:error, :not_found} -> Baskets.update_basket(basket, %{products: product})
      end

      page = Products.list_products_basket(basket.id)
      count = length(page.entries)
      sum_price = Orders.sum_price(page.entries)
      render(conn, "update.json", Map.put(sum_price, :count, count))
    end
  end
end
