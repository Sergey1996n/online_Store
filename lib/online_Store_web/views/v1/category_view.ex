defmodule Online_StoreWeb.V1.CategoryView do
  use Online_StoreWeb, :view

  alias Online_StoreWeb.V1.ProductView

  def render("index.json", %{categories: categories}) do
    render_many(categories, __MODULE__, "show.json", as: :category)
  end

  def render("show.json", %{category: category}) do
    %{
      id: category.id,
      title: category.title
    }
  end

  def render("index_product.json", %{products: products}) do
    render_many(products, ProductView, "show.json", as: :product)
  end
end
