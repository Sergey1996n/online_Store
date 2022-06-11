defmodule Online_Store.Wishlists do
  alias Online_Store.Wishlists.Commands.{
    CreateWishlist,
    UpdateWishlist,
    DeleteProductWishlist
  }

  alias Online_Store.Wishlists.Queries.{
    GetWishlist,
    ListWishlists,
    GetWishlistUser
  }

  # Commands
  defdelegate create_wishlist(attrs), to: CreateWishlist, as: :process
  defdelegate update_wishlist(wishlist, attrs), to: UpdateWishlist, as: :process
  defdelegate delete_product(wishlist, attrs), to: DeleteProductWishlist, as: :process
  # Queries
  defdelegate get_wishlist(id), to: GetWishlist, as: :process
  defdelegate list_wishlists(), to: ListWishlists, as: :process
  defdelegate get_wishlist_user(user_id), to: GetWishlistUser, as: :process
end
