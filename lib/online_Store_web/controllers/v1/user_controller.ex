defmodule Online_StoreWeb.V1.UserController do
  use Online_StoreWeb, :controller

  alias Online_Store.Accounts
  alias Online_Store.Accounts.Auth
  alias Online_StoreWeb.ApplyParams

  action_fallback(Online_StoreWeb.FallbackController)

  defmodule CreateUserParams do
    use Params.Schema, %{
      phone_number!: :string,
      email: :string,
      name: :string,
      surname: :string,
      nickname: :string,
      birthday: :date,
      password!: :string
    }
  end

  def create(conn, attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateUserParams, attrs),
         {:ok, user} <- Accounts.create_user(attrs),
         {:ok, access_token, refresh_token} <- Auth.sign_user(user) do
      conn
      |> put_status(:created)
      |> render("create.json", %{
        user: user,
        access_token: access_token,
        refresh_token: refresh_token
      })
    end
  end

  # def update(conn, %{"current_user" => current_user, "id" => id} = param) do
  #   IO.inspect(current_user)
  #   user = Accounts.get_user(id)
  #   IO.inspect(user)
  #   with {:ok, attrs} <- ApplyParams.do_apply(CreateUserParams, param),
  #        {:ok, user} <- Accounts.update_user(user, attrs) do
  #        IO.inspect(current_user)
  #   end
  # end
end
