defmodule Online_StoreWeb.V1.ProductView do
  use Online_StoreWeb, :view

  def render("show.json", %{product: product}) do
    %{
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price
    }
  end
end
