defmodule Online_Store.Products.Commands.DeleteProduct do
  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  def process(%Product{} = product) do
    Repo.delete(product)
  end
end
