defmodule Online_Store.Baskets.Queries.GetBasket do
  alias Online_Store.{
    Repo,
    Baskets.Entities.Basket
  }

  def process(id) do
    Repo.find(Basket, id)
  end
end
