defmodule Online_StoreWeb.V1.BasketPolicy do
  @behaviour Bodyguard.Policy

  alias Online_Store.Accounts.Entities.User
  alias Online_Store.Baskets.Entities.Basket

  def authorize(action, %User{id: id}, %Basket{user_id: id})
      when action in [:show],
      do: :ok

  def authorize(_action, _user, _params), do: false
end
