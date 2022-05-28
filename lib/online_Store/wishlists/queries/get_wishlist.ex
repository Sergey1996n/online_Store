defmodule Online_Store.Wishlists.Queries.GetWishlist do
  alias Online_Store.{
    Repo,
    Wishlists.Entities.Wishlist
  }

  def process(id) do
    Repo.find(Wishlist, id)
  end
end
