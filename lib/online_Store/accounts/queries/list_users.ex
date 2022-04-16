defmodule Online_Store.Accounts.Queries.ListUsers do
  alias Online_Store.{
    Repo,
    Accounts.Entities.User
  }

  def process() do
    Repo.all(User)
  end
end
