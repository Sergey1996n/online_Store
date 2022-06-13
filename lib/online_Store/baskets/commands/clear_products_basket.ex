defmodule Online_Store.Baskets.Commands.ClearProductsBasket do
  alias Online_Store.{
    Repo,
    Baskets.Entities.Basket
  }

  def process(%Basket{} = basket) do
    basket
    |> Basket.clear_product_changeset()
    |> Repo.update()
  end
end
