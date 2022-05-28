defmodule Online_Store.Products.Commands.CreateProduct do
  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process(attrs) do
    %Product{}
    |> Product.create_changeset(attrs)
    |> Repo.insert()
  end
end
