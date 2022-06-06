defmodule Online_Store.Accounts.Auth do
  alias Online_Store.Accounts.Entities.User
  alias Online_Store.Accounts.Services.Guardian

  def sign_user(%User{} = user), do: Guardian.sign(user)
end
