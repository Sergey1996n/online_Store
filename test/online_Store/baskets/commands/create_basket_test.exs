defmodule Online_Store.Baskets.Commands.CreateBasketTest do
  use Online_Store.DataCase

  alias Online_Store.{
    Baskets
  }

  test "process/1 create basket test" do
    user = insert(:user)
    assert {:ok, create_basket} = Baskets.create_basket(%{user_id: user.id})
    assert create_basket.user_id == user.id
  end
end
