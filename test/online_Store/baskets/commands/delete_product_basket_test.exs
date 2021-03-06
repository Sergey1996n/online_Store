defmodule Online_Store.Baskets.Commands.DeleteProductBasketTest do
  use Online_Store.DataCase

  alias Online_Store.{
    Baskets
  }

  setup do
    user = insert(:user)
    {:ok, create_basket} = Baskets.create_basket(%{user_id: user.id})
    {:ok, %{basket: create_basket}}
  end

  test "process/2 delete product not null basket test", %{basket: create_basket} do
    product = insert(:product)
    {:ok, updated_basket} = Baskets.update_basket(create_basket, %{products: product})
    {:ok, updated_basket} = Baskets.delete_product(updated_basket, %{products: product})
    assert updated_basket.products == []
  end

  test "process/2 delete product null basket test", %{basket: create_basket} do
    [product_1, product_2] = insert_list(2, :product)
    {:ok, updated_basket} = Baskets.update_basket(create_basket, %{products: product_1})
    {:ok, updated_basket} = Baskets.update_basket(updated_basket, %{products: product_2})
    {:ok, updated_basket} = Baskets.delete_product(updated_basket, %{products: product_1})
    assert updated_basket.products == [product_2]
  end
end
