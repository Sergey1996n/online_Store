defmodule Online_Store.Baskets.Queries.GetBasketTest do
  use Online_Store.DataCase

  alias Online_Store.Baskets

  test "process/1 get basket by id" do
    basket = insert(:basket)
    assert {:ok, result} = Baskets.get_basket(basket.id)
    assert basket.id == result.id
  end
end
