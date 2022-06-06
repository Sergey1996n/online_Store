defmodule Online_StoreWeb.V1.UserControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user)
    conn = as_user(conn, user) |> IO.inspect()
    {:ok, %{conn: conn, user: user}}
  end

  test "create/2 create user", %{conn: conn} do
    attrs = %{
      "phone_number" => "89892983885",
      "password" => "testPassword1"
    }

    response =
      conn
      |> post(user_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "access_token" => response["access_token"],
             "refresh_token" => response["refresh_token"],
             "user" => %{
               "phone_number" => attrs["phone_number"]
             }
           }
  end

  @tag :kek
  test "update/2 update user", %{conn: conn, user: user} do
    # attrs = %{
    #   "phone_number" => "89892983885",
    #   "password" => "testPassword1"
    # }
    IO.inspect(user)
    attrs = %{
      "phone_number" => "89892983880",
      "password" => "testPassword2"
    }

    response =
      conn
      # |> IO.inspect()
      |> post(user_path(conn, :update, user, attrs))
      |> json_response(200)
  end
end