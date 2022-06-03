defmodule Online_Store.Baskets.Commands.CreateBasket do
  alias Online_Store.{
    Repo,
    Baskets.Entities.Basket
  }

  def process(attrs) do
    %Basket{}
    |> Basket.create_changeset(attrs)
    |> Repo.insert()
  end
end
