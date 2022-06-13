defmodule Online_Store.Products.Queries.GetProductInWishlist do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Wishlists.Entities.Wishlist
  }

  def process(wishlist_id, product_id) do
    Wishlist
    |> product_wishlist(wishlist_id, product_id)
    |> Repo.fetch_one()
  end

  defp product_wishlist(query, wishlist_id, product_id) do
    from wishlist in query,
      where: wishlist.id == ^wishlist_id,
      join: products in assoc(wishlist, :products),
      where: products.id == ^product_id,
      preload: [products: products]
  end
end
