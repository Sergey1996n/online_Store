defmodule Online_Store.Baskets.Commands.UpdateBasketTest do
  use Online_Store.DataCase

  alias Online_Store.{
    Baskets
  }

  test "process/1 update_basket test" do
    basket = insert(:basket)
    attrs = %{products: insert(:product)}
    assert {:ok, updated_basket} = Baskets.update_basket(basket, attrs)
    assert updated_basket.products == [attrs.products]
  end
end
