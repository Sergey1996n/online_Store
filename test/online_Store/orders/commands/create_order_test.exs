defmodule Online_Store.Orders.Queries.CreateOrderTest do
  use Online_Store.DataCase

  alias Online_Store.Orders

  test "process/1 create order" do
    user = insert(:user)
    list_products = insert_list(3, :product)
    {:ok, create_order} = Orders.create_order(%{user_id: user.id, products: list_products})
    assert create_order.user_id == user.id
    assert create_order.products == list_products
  end
end
