defmodule Online_Store.Accounts.Commands.DeleteUserTest do
  use Online_Store.DataCase

  alias Online_Store.Accounts

  test "process/1 delete_user test" do
    user = insert(:user)
    assert {:ok, _result} = Accounts.delete_user(user)
    assert {:error, :not_found} = Accounts.get_user(user.id)
  end
end
