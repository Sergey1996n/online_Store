defmodule Online_Store.Baskets.Queries.GetBasketUser do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Baskets.Entities.Basket
  }

  def process(user_id) do
    Basket
    |> by_basket(user_id)
    |> Repo.fetch_one()
  end

  defp by_basket(query, user_id) do
    from basket in query,
      where: basket.user_id == ^user_id,
      preload: [:products]
  end
end
