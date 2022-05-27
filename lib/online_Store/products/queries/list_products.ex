defmodule Online_Store.Products.Queries.ListProducts do
  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process() do
    Repo.all(Product)
  end
end
