defmodule Online_Store.Accounts.Commands.DeleteUser do
  alias Online_Store.{
    Repo,
    Accounts.Entities.User
  }

  def process(%User{} = user) do
    Repo.delete(user)
  end
end
