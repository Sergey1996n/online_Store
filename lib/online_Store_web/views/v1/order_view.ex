defmodule Online_StoreWeb.V1.OrderView do
  use Online_StoreWeb, :view

  alias Online_StoreWeb.V1.ProductView

  def render("create.json", %{order: order}) do
    %{
      order: %{
        sum_price: order.sum_price,
        products: render_many(order.products, ProductView, "show.json", as: :product)
      }
    }
  end
end
