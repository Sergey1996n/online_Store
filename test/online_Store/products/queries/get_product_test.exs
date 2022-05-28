defmodule Online_Store.Products.Queries.GetProductTest do
  use Online_Store.DataCase

  alias Online_Store.Products

  test "process/1 get product by id" do
    product = insert(:product)
    assert {:ok, result} = Products.get_product(product.id)
    assert product.id == result.id
  end
end
