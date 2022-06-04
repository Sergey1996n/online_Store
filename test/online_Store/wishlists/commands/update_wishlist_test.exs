defmodule Online_Store.Wishlists.Commands.UpdateWishlistTest do
  use Online_Store.DataCase

  alias Online_Store.{
    Wishlists
  }

  test "process/1 update_wishlist test" do
    wishlist = insert(:wishlist)
    attrs = %{products: insert(:product)}
    assert {:ok, updated_wishlist} = Wishlists.update_wishlist(wishlist, attrs)
    assert updated_wishlist.products == [attrs.products]
  end
end
