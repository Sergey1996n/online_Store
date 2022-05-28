defmodule Online_Store.Products.Commands.UpdateProduct do
  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process(%Product{} = product, attrs) do
    product
    |> Product.update_changeset(attrs)
    |> Repo.update()
  end
end
