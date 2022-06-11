defmodule Online_Store.Products.Queries.ListProductsCategoryTest do
  use Online_Store.DataCase

  alias Online_Store.Products

  test "process/1 list_products_category test" do
    category_1 = insert(:category)
    category_2 = insert(:category)
    insert_list(2, :product, %{category: category_1})
    insert_list(2, :product, %{category: category_2})
    result = Products.list_products_category(category_1.id).entries
    assert length(result) == 2
  end
end
