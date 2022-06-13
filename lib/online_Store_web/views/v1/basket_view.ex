defmodule Online_StoreWeb.V1.BasketView do
  use Online_StoreWeb, :view

  alias Online_StoreWeb.V1.ProductView

  def render("index_product.json", %{page: page}) do
    %{
      entries: render_many(page.entries, ProductView, "show.json", as: :product),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("update.json", %{sum_price: sum_price, count: count}) do
    %{count: count, sum_price: sum_price}
  end
end
