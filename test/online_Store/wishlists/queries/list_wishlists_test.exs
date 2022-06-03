defmodule Online_Store.Wishlists.Queries.ListWishlistsTest do
  use Online_Store.DataCase

  alias Online_Store.Wishlists

  test "process/1 list_wishlist test" do
    insert_list(10, :wishlist)
    result = Wishlists.list_wishlists()
    assert length(result) == 10
  end
end
