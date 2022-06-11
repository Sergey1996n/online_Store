defmodule Online_Store.Wishlists.Commands.DeleteProductWishlistTest do
  use Online_Store.DataCase

  alias Online_Store.{
    Wishlists
  }

  setup do
    user = insert(:user)
    {:ok, create_wishlist} = Wishlists.create_wishlist(%{user_id: user.id})
    {:ok, %{wishlist: create_wishlist}}
  end

  test "process/2 delete product not null wishlist test", %{wishlist: create_wishlist} do
    product = insert(:product)
    {:ok, updated_wishlist} = Wishlists.update_wishlist(create_wishlist, %{products: product})
    {:ok, updated_wishlist} = Wishlists.delete_product(updated_wishlist, %{products: product})
    assert updated_wishlist.products == []
  end

  test "process/2 delete product null wishlist test", %{wishlist: create_wishlist} do
    [product_1, product_2] = insert_list(2, :product)
    {:ok, updated_wishlist} = Wishlists.update_wishlist(create_wishlist, %{products: product_1})
    {:ok, updated_wishlist} = Wishlists.update_wishlist(updated_wishlist, %{products: product_2})
    {:ok, updated_wishlist} = Wishlists.delete_product(updated_wishlist, %{products: product_1})
    assert updated_wishlist.products == [product_2]
  end
end
