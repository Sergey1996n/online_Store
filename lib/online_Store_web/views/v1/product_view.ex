defmodule Online_StoreWeb.V1.ProductView do
  use Online_StoreWeb, :view

  # def render("index.json", %{products: products}) do
  #   render_many(products, __MODULE__, "show.json", as: :product)
  # end

  def render("show.json", %{product: product}) do
    %{
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price
    }
  end
end
