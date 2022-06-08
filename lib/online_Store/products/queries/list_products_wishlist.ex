defmodule Online_Store.Products.Queries.ListProductsWishlist do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process(wishlist_id, param) do
    Product
    |> by_wishlist(wishlist_id)
    |> sort(param)
    |> Repo.all()
  end

  defp by_wishlist(query, wishlist_id) do
    from product in query,
      where: product.wishlist_id == ^wishlist_id
  end

  defp sort(query, %{order: order}) do
    case order do
      1 ->
        from product in query,
          order_by: [desc: :price]

      2 ->
        from product in query,
          order_by: [asc: :title]

      3 ->
        from product in query,
          order_by: [desc: :inserted_at]
    end
  end

  defp sort(query, _) do
    from product in query,
      order_by: [asc: :price]
  end
end
