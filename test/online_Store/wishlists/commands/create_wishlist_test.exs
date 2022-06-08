defmodule Online_Store.Wishlists.Commands.CreateWishlistTest do
  use Online_Store.DataCase

  alias Online_Store.{
    Wishlists
  }

  test "process/1 create wishlist test" do
    user = insert(:user)
    assert {:ok, create_wishlist} = Wishlists.create_wishlist(%{user_id: user.id})
    assert create_wishlist.user_id == user.id
  end
end
