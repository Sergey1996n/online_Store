defmodule Online_StoreWeb.V1.CategoryController do
  use Online_StoreWeb, :controller

  alias Online_Store.Categories
  alias Online_Store.Products
  alias Online_StoreWeb.ApplyParams

  action_fallback(Online_StoreWeb.FallbackController)

  defmodule ShowCategoryParams do
    use Params.Schema, %{
      order: :string,
      from: :string,
      to: :string
    }
  end

  def index(conn, _params) do
    categories = Categories.list_category()
    render(conn, "index.json", %{categories: categories})
  end

  # def show(conn, %{"id" => category_id} = params) do
  #   with {:ok, params} <- ApplyParams.do_apply(ShowCategoryParams, params) do
  #     page = Products.list_products_category(category_id, params)
  #     render(conn, "index_product.json", %{page: page})
  #   end
  # end

  def show(conn, %{"id" => category_id} = params) do
    with {:ok, params} <- ApplyParams.do_apply(ShowCategoryParams, params) do
      page = Products.list_products_category(category_id, params)
      render(conn, "index_product.json", %{page: page})
    end
  end
end
