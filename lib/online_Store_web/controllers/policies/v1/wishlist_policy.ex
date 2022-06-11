defmodule Online_StoreWeb.V1.WishlistPolicy do
  @behaviour Bodyguard.Policy

  alias Online_Store.Accounts.Entities.User
  alias Online_Store.Wishlists.Entities.Wishlist

  def authorize(action, %User{id: id}, %Wishlist{user_id: id})
      when action in [:show],
      do: :ok

  def authorize(_action, _user, _params), do: false
end
