defmodule Online_Store.Baskets.Commands.UpdateBasket do
  alias Online_Store.{
    Repo,
    Baskets.Entities.Basket
  }

  def process(%Basket{} = basket, attrs) do
    basket
    |> Basket.update_changeset(attrs)
    |> Repo.update()
  end
end
