defmodule Online_Store.Categories.Commands.DeleteCategoryTest do
  use Online_Store.DataCase

  alias Online_Store.Categories

  test "process/1 delete_category test" do
    category = insert(:category)
    assert {:ok, _result} = Categories.delete_category(category)
    assert {:error, :not_found} = Categories.get_category(category.id)
  end
end
