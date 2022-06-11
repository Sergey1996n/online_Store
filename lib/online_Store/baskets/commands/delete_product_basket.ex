defmodule Online_Store.Baskets.Commands.DeleteProductBasket do
  alias Online_Store.{
    Repo,
    Baskets.Entities.Basket
  }

  def process(%Basket{} = basket, attrs) do
    basket
    |> Basket.delete_changeset(attrs)
    |> Repo.update()
  end
end
