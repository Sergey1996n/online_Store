defmodule Online_Store.Wishlists.Queries.GetWishlistTest do
  use Online_Store.DataCase

  alias Online_Store.Wishlists

  test "process/1 get wishlist by id" do
    wishlist = insert(:wishlist)
    assert {:ok, result} = Wishlists.get_wishlist(wishlist.id)
    assert wishlist.id == result.id
  end
end
