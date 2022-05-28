defmodule Online_Store.Products.Commands.UpdateProductTest do
  use Online_Store.DataCase

  alias Online_Store.Products

  test "process/1 update_product test" do
    product = insert(:product, %{price: 5000}) 
    attrs = %{price: 2000}
    assert {:ok, updated_product} = Products.update_product(product, attrs)
    assert updated_product.price == attrs.price
  end
end
