defmodule Online_Store.Wishlists.Commands.UpdateWishlist do
  alias Online_Store.{
    Repo,
    Wishlists.Entities.Wishlist
  }

  def process(%Wishlist{} = wishlist, attrs) do
    wishlist
    |> Wishlist.update_changeset(attrs)
    |> Repo.update()
  end
end
