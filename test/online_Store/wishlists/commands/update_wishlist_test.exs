defmodule Online_Store.Wishlists.Commands.UpdateWishlistTest do
  use Online_Store.DataCase

  alias Online_Store.{
    Wishlists
  }

  setup do
    user = insert(:user)
    {:ok, create_wishlist} = Wishlists.create_wishlist(%{user_id: user.id})
    {:ok, %{wishlist: create_wishlist}}
  end

  test "process/1 update null wishlist test", %{wishlist: create_wishlist} do
    attrs = %{products: insert(:product)}
    assert {:ok, updated_wishlist} = Wishlists.update_wishlist(create_wishlist, attrs)
    assert updated_wishlist.products == [attrs.products]
  end

  test "process/1 update not null wishlist test", %{wishlist: create_wishlist} do
    [product_1, product_2] = insert_list(2, :product)
    {:ok, updated_wishlist} = Wishlists.update_wishlist(create_wishlist, %{products: product_1})

    {:ok, updated_wishlist} = Wishlists.update_wishlist(updated_wishlist, %{products: product_2})

    assert updated_wishlist.products == [product_2, product_1]
  end
end
