defmodule Online_Store.Wishlists.Queries.GetWishlistUserTest do
  use Online_Store.DataCase

  alias Online_Store.Wishlists

  test "process/1 get wishlist user" do
    user = insert(:user)
    wishlist = insert(:wishlist, %{user: user})
    assert {:ok, result} = Wishlists.get_wishlist_user(user.id)
    assert wishlist.id == result.id
  end
end
