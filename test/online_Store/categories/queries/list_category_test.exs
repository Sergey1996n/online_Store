defmodule Online_Store.Categories.Queries.ListCategoriesTest do
  use Online_Store.DataCase

  alias Online_Store.Categories

  test "process/1 list_categories test" do
    insert_list(10, :category)
    result = Categories.list_category()
    assert length(result) == 10
  end
end
