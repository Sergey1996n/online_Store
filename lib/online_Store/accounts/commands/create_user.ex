defmodule Online_Store.Accounts.Commands.CreateUser do
  alias Online_Store.{
    Repo,
    Accounts.Entities.User
  }

  def process(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end
end
