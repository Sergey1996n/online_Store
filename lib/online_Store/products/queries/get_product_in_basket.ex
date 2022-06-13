defmodule Online_Store.Products.Queries.GetProductInBasket do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Baskets.Entities.Basket
  }

  def process(basket_id, product_id) do
    Basket
    |> product_basket(basket_id, product_id)
    |> Repo.fetch_one()
  end

  defp product_basket(query, basket_id, product_id) do
    from basket in query,
      where: basket.id == ^basket_id,
      join: products in assoc(basket, :products),
      where: products.id == ^product_id,
      preload: [products: products]
  end
end
