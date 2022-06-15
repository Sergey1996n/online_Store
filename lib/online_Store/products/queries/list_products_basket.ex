defmodule Online_Store.Products.Queries.ListProductsBasket do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Relations.BasketProduct
  }

  def process(basket_id, params) do
    BasketProduct
    |> by_basket(basket_id)
    |> sort(params)
    |> Repo.paginate(params)
  end

  defp by_basket(query, basket_id) do
    from basket_product in query,
      where: basket_product.basket_id == ^basket_id
  end

  defp sort(query, %{order: order}) do
    case order do
      1 ->
        from basket_product in query,
          join: product in assoc(basket_product, :product),
          select: product,
          order_by: [asc: product.price]

      2 ->
        from basket_product in query,
          join: product in assoc(basket_product, :product),
          select: product,
          order_by: [asc: product.title]

      3 ->
        from basket_product in query,
          join: product in assoc(basket_product, :product),
          select: product,
          order_by: [desc: product.price]

      _ ->
        from basket_product in query,
          join: product in assoc(basket_product, :product),
          select: product,
          order_by: [desc: :inserted_at]
    end
  end

  defp sort(query, _) do
    from basket_product in query,
      join: product in assoc(basket_product, :product),
      select: product,
      order_by: [desc: :inserted_at]
  end
end
