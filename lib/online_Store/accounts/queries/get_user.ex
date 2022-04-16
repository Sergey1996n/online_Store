defmodule Online_Store.Accounts.Queries.GetUser do
  alias Online_Store.{
    Repo,
    Accounts.Entities.User
  }

  def process(id) do
    Repo.find(User, id)
  end
end
