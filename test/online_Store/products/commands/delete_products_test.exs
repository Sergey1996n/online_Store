defmodule Online_Store.Products.Commands.DeleteProductTest do
  use Online_Store.DataCase

  alias Online_Store.Products

  test "process/1 delete_product test" do
    product = insert(:product)
    assert {:ok, _result} = Products.delete_product(product)
    assert {:error, :not_found} = Products.get_product(product.id)
  end
end
