defmodule Online_Store.Wishlists.Queries.GetWishlistUser do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Wishlists.Entities.Wishlist
  }

  def process(user_id) do
    Wishlist
    |> by_wishlist(user_id)
    |> Repo.fetch_one()
  end

  defp by_wishlist(query, user_id) do
    from wishlist in query,
      where: wishlist.user_id == ^user_id
  end
end
