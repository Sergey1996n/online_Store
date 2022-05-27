defmodule Online_Store.Categories.Commands.UpdateCategory do
  alias Online_Store.{
    Repo,
    Categories.Entities.Category
  }

  def process(%Category{} = category, attrs) do
    category
    |> Category.update_changeset(attrs)
    |> Repo.update()
  end
end
