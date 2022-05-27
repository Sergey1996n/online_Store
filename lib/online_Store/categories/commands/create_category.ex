defmodule Online_Store.Categories.Commands.CreateCategory do
  alias Online_Store.{
    Repo,
    Categories.Entities.Category
  }

  def process(attrs) do
    %Category{}
    |> Category.create_changeset(attrs)
    |> Repo.insert()
  end
end
