defmodule Online_Store.Accounts.Queries.ListUsersTest do
  use Online_Store.DataCase

  alias Online_Store.Accounts

  test "process/1 list_users test" do
    insert_list(10, :user)
    result = Accounts.list_users()
    assert length(result) == 10
  end
end
