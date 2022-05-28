defmodule Online_Store.Wishlists.Queries.ListWishlists do
  alias Online_Store.{
    Repo,
    Wishlists.Entities.Wishlist
  }

  def process() do
    Repo.all(Wishlist)
  end
end
