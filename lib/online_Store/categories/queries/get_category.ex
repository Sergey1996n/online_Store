defmodule Online_Store.Categories.Queries.GetCategory do
  alias Online_Store.{
    Repo,
    Categories.Entities.Category
  }

  def process(id) do
    Repo.find(Category, id)
  end
end
