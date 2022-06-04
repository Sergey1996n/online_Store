defmodule Online_Store.Products.Queries.ListProductsCategory do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process(id) do
    Product
    |> by_id(id)
    # |> Repo.fetch_one()
    |> Repo.all()
  end

  defp by_id(query, id) do
    from product in query,
      where: product.category_id == ^id
  end
end
