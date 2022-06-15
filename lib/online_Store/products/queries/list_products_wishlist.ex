defmodule Online_Store.Products.Queries.ListProductsWishlist do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Relations.WishlistProduct
  }

  def process(wishlist_id, params) do
    WishlistProduct
    |> by_wishlist(wishlist_id)
    |> sort(params)
    |> Repo.paginate(params)
  end

  defp by_wishlist(query, wishlist_id) do
    from wishlist_product in query,
      where: wishlist_product.wishlist_id == ^wishlist_id
  end

  defp sort(query, %{order: order}) do
    case order do
      1 ->
        from wishlist_product in query,
          join: product in assoc(wishlist_product, :product),
          select: product,
          order_by: [asc: product.price]

      2 ->
        from wishlist_product in query,
          join: product in assoc(wishlist_product, :product),
          select: product,
          order_by: [asc: product.title]

      3 ->
        from wishlist_product in query,
          join: product in assoc(wishlist_product, :product),
          select: product,
          order_by: [desc: product.price]

      _ ->
        from wishlist_product in query,
          join: product in assoc(wishlist_product, :product),
          select: product,
          order_by: [desc: :inserted_at]
    end
  end

  defp sort(query, _) do
    from wishlist_product in query,
      join: product in assoc(wishlist_product, :product),
      select: product,
      order_by: [desc: :inserted_at]
  end
end
