defmodule Online_Store.Baskets.Queries.ListBasketsTest do
  use Online_Store.DataCase

  alias Online_Store.Baskets

  @tag :kek
  test "process/1 list_baskets test" do
    insert_list(10, :basket)
    result = Baskets.list_baskets()
    assert length(result) == 10
  end
end
