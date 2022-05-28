defmodule Online_Store.Wishlists.Commands.UpdateWishlistTest do
  use Online_Store.DataCase

  alias Online_Store.{
    Wishlists,
    # Products
  }

  @tag :kek
  test "process/1 update_wishlist test" do
    wishlist = insert(:wishlist)
    product = insert(:product) |> IO.inspect()
    attrs = %{products: product}
    assert {:ok, updated_wishlist} = Wishlists.update_wishlist(wishlist, attrs)
    assert updated_wishlist.products == attrs.products
  end
end
