defmodule Online_StoreWeb.V1.WishlistController do
  use Online_StoreWeb, :controller

  alias Online_Store.Wishlists
  alias Online_Store.Products
  alias Online_StoreWeb.ApplyParams

  action_fallback(Online_StoreWeb.FallbackController)

  defmodule ShowWishlistParams do
    use Params.Schema, %{
      order: :integer,
      page!: :integer,
      page_size!: :integer
    }
  end

  def show(conn, %{"current_user" => current_user} = params) do
    with {:ok, params} <- ApplyParams.do_apply(ShowWishlistParams, params),
         {:ok, wishlist} <- Wishlists.get_wishlist_user(current_user.id) do
      page = Products.list_products_wishlist(wishlist.id, params)
      render(conn, "index_product.json", %{page: page})
    end
  end
end
