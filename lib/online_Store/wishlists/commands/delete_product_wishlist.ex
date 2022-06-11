defmodule Online_Store.Wishlists.Commands.DeleteProductWishlist do
  alias Online_Store.{
    Repo,
    Wishlists.Entities.Wishlist
  }

  def process(%Wishlist{} = wishlist, attrs) do
    wishlist
    |> Wishlist.delete_changeset(attrs)
    |> Repo.update()
  end
end
