defmodule Online_Store.Products.Queries.ListProductsCategory do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process(category_id, params) do
    Product
    |> by_category(category_id)
    |> filter(params)
    |> sort(params)
    |> Repo.paginate(params)
  end

  defp by_category(query, category_id) do
    from product in query,
      where: product.category_id == ^category_id
  end

  defp sort(query, %{order: order}) do
    case Integer.parse(order) do
      {1, ""} ->
        from product in query,
          order_by: [desc: :price]

      {2, ""} ->
        from product in query,
          order_by: [asc: :title]

      {3, ""} ->
        from product in query,
          order_by: [desc: :inserted_at]

      _ ->
        from product in query,
          order_by: [asc: :price]
    end
  end

  defp sort(query, _) do
    from product in query,
      order_by: [asc: :price]
  end

  # Filter price
  defp filter(query, %{from: from, to: to}) do
    with {to, ""} <- Integer.parse(to),
         {from, ""} <- Integer.parse(from) do
      from product in query,
        where: product.price >= ^from and product.price <= ^to
    else
      _ -> query
    end
  end

  defp filter(query, %{from: from}) do
    with {from, ""} <- Integer.parse(from) do
      from product in query,
        where: product.price >= ^from
    else
      _ -> query
    end
  end

  defp filter(query, %{to: to}) do
    with {to, ""} <- Integer.parse(to) do
      from product in query,
        where: product.price <= ^to
    else
      _ -> query
    end
  end

  defp filter(query, _), do: query
end
