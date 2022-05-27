defmodule Online_Store.Categories.Commands.UpdateCategoryTest do
  use Online_Store.DataCase

  alias Online_Store.Categories

  test "process/1 update_category test" do
    category = insert(:category, %{title: "Телефон"})
    attrs = %{title: "Стиральная машина"}
    assert {:ok, updated_category} = Categories.update_category(category, attrs)
    assert updated_category.title == attrs.title
  end
end
