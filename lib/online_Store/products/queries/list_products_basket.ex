defmodule Online_Store.Products.Queries.ListProductsBasket do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process(basket_id, params) do
    Product
    |> by_basket(basket_id)
    |> sort(params)
    |> Repo.paginate(params)
  end

  defp by_basket(query, basket_id) do
    from product in query,
      join: baskets in assoc(product, :baskets),
      where: baskets.id == ^basket_id,
      preload: [baskets: baskets]
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
