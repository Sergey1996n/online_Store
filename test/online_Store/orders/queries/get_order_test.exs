defmodule Online_Store.Orders.Queries.GetOrderTest do
  use Online_Store.DataCase

  alias Online_Store.Orders

  test "process/1 get order by id" do
    user = insert(:user)
    list_products = insert_list(3, :product)
    {:ok, create_order} = Orders.create_order(%{user_id: user.id, products: list_products})
    {:ok, result} = Orders.get_order(create_order.id)
    assert result.id == create_order.id
  end
end
