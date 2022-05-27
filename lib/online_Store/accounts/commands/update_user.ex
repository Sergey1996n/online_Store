defmodule Online_Store.Accounts.Commands.UpdateUser do
  alias Online_Store.{
    Repo,
    Accounts.Entities.User
  }

  def process(%User{} = user, attrs) do
    user
    |> User.update_changeset(attrs)
    |> Repo.update()
  end
end
