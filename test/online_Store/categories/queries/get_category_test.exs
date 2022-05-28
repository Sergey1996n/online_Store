defmodule Online_Store.Categories.Queries.GetCategoryTest do
  use Online_Store.DataCase

  alias Online_Store.Categories

  test "process/1 get category by id" do
    category = insert(:category)
    assert {:ok, result} = Categories.get_category(category.id)
    assert category.id == result.id
  end
end
