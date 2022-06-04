defmodule Online_StoreWeb.V1.ProductController do
  use Online_StoreWeb, :controller

  alias Online_Store.Products

  action_fallback(Online_StoreWeb.FallbackController)

  def index(conn, %{"id" => id}) do
    products = Products.list_products_category(id)
    render(conn, "index.json", %{products: products})
  end

  def show(conn, %{"id" => id}) do
    with {:ok, product} <- Products.get_product(id) do
      render(conn, "show.json", %{product: product})
    end
  end
end
