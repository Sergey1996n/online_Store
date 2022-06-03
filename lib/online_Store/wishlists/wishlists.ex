defmodule Online_Store.Wishlists do
  alias Online_Store.Wishlists.Commands.{
    CreateWishlist,
    UpdateWishlist
  }

  alias Online_Store.Wishlists.Queries.{
    GetWishlist,
    ListWishlists
  }

  # Commands
  defdelegate create_wishlist(attrs), to: CreateWishlist, as: :process
  defdelegate update_wishlist(wishlist, attrs), to: UpdateWishlist, as: :process
  # Queries
  defdelegate get_wishlist(id), to: GetWishlist, as: :process
  defdelegate list_wishlists(), to: ListWishlists, as: :process
end
