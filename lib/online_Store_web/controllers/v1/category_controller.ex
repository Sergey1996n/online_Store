defmodule Online_StoreWeb.V1.CategoryController do
  use Online_StoreWeb, :controller

  alias Online_Store.Categories
  alias Online_Store.Products

  action_fallback(Online_StoreWeb.FallbackController)

  # Нужен ли _params
  def index(conn, _params) do
    categories = Categories.list_category()
    render(conn, "index.json", %{categories: categories})
  end

  def show(conn, %{"id" => id}) do
    # Products.list_products_category(id)
    products = Products.list_products_category(id)
    render(conn, "index_product.json", %{products: products})
  end
end
