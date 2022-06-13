defmodule Online_Store.Orders.Queries.ListOrdersTest do
  use Online_Store.DataCase

  alias Online_Store.Orders

  test "process/1 list orders" do
    user = insert(:user)
    insert_list(10, :order, %{user: user})
    result = Orders.list_orders(user.id)
    assert length(result.entries) == 10
  end
end
