defmodule Online_StoreWeb.V1.BasketController do
  use Online_StoreWeb, :controller

  alias Online_Store.Baskets
  alias Online_Store.Products
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
end
