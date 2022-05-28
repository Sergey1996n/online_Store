defmodule Online_Store.Products.Queries.ListProductsTest do
  use Online_Store.DataCase

  alias Online_Store.Products

  test "process/1 list_products test" do
    insert_list(10, :product)
    result = Products.list_products()
    assert length(result) == 10
  end
end
