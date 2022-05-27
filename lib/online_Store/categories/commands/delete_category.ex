defmodule Online_Store.Categories.Commands.DeleteCategory do
  alias Online_Store.{
    Repo,
    Categories.Entities.Category
  }

  def process(%Category{} = user) do
    Repo.delete(user)
  end
end
