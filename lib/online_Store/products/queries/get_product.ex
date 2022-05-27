defmodule Online_Store.Products.Queries.GetProduct do
  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process(id) do
    Repo.find(Product, id)
  end
end
