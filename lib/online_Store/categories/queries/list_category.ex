defmodule Online_Store.Categories.Queries.ListCategory do
  alias Online_Store.{
    Repo,
    Categories.Entities.Category
  }

  def process() do
    Repo.all(Category)
  end
end
