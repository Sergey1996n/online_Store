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

  def update(conn, %{"current_user" => current_user} = params) do
    with {:ok, wishlist} <- Wishlists.get_wishlist_user(current_user.id),
         {:ok, product} <- Products.get_product(params["product_id"]) do
      case Products.get_product_in_wishlist(wishlist.id, product.id) do
        {:ok, _product} -> Wishlists.delete_product(wishlist, %{products: product})
        {:error, :not_found} -> Wishlists.update_wishlist(wishlist, %{products: product})
      end

      page = Products.list_products_wishlist(wishlist.id)
      count = length(page.entries)
      render(conn, "update.json", %{count: count})
    end
  end
end
