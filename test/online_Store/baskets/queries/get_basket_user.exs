defmodule Online_Store.Baskets.Queries.GetBasketUserTest do
  use Online_Store.DataCase

  alias Online_Store.Baskets

  test "process/1 get basket user" do
    user = insert(:user)
    basket = insert(:basket, %{user: user})
    assert {:ok, result} = Baskets.get_basket_user(user.id)
    assert basket.id == result.id
  end
end
