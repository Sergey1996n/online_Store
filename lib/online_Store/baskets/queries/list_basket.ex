defmodule Online_Store.Baskets.Queries.ListBaskets do
  alias Online_Store.{
    Repo,
    Baskets.Entities.Basket
  }

  def process() do
    Repo.all(Basket)
  end
end
