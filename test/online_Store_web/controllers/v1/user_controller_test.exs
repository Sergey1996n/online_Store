defmodule Online_StoreWeb.V1.UserControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user, %{password: "testPassword1"})
    conn = as_user(conn, user)
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
               "birthday" => nil,
               "email" => nil,
               "name" => nil,
               "nickname" => nil,
               "phone_number" => attrs["phone_number"],
               "surname" => nil
             }
           }
  end

  test "update/2 update user", %{conn: conn, user: user} do
    attrs = %{
      "name" => "Sergey",
      "surname" => "Tsatsenko"
    }

    response =
      conn
      |> patch(user_path(conn, :update, user, attrs))
      |> json_response(200)

    assert response == %{
             "user" => %{
               "birthday" => Date.to_string(user.birthday),
               "email" => user.email,
               "name" => attrs["name"],
               "nickname" => user.nickname,
               "phone_number" => user.phone_number,
               "surname" => attrs["surname"]
             }
           }
  end
end
