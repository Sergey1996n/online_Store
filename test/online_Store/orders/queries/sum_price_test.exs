defmodule Online_Store.Orders.Queries.SumPriceTest do
  use Online_Store.DataCase

  alias Online_Store.Orders

  test "process/2 sum price products" do
    user = insert(:user)
    list_products = insert_list(3, :product)
    {:ok, create_order} = Orders.create_order(%{user_id: user.id, products: list_products})
    assert Orders.sum_price(create_order.products).sum_price == create_order.sum_price
  end
end
