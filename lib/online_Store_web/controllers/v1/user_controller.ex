defmodule Online_StoreWeb.V1.UserController do
  use Online_StoreWeb, :controller

  alias Online_Store.Accounts
  alias Online_Store.Accounts.Auth
  alias Online_Store.Wishlists
  alias Online_Store.Baskets
  alias Online_StoreWeb.ApplyParams
  alias Online_StoreWeb.ErrorView

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

  defmodule UpdateUserParams do
    use Params.Schema, %{
      phone_number: :string,
      email: :string,
      name: :string,
      surname: :string,
      nickname: :string,
      birthday: :date,
      password: :string
    }
  end

  def create(conn, attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateUserParams, attrs),
         {:ok, user} <- Accounts.create_user(attrs),
         {:ok, access_token, refresh_token} <- Auth.sign_user(user),
         {:ok, _wishlist} <- Wishlists.create_wishlist(%{user_id: user.id}),
         {:ok, _basket} <- Baskets.create_basket(%{user_id: user.id}) do
      conn
      |> put_status(:created)
      |> render("create.json", %{
        user: user,
        access_token: access_token,
        refresh_token: refresh_token
      })
    else
      {:error, _} ->
        conn
        |> put_status(:bad_request)
        |> put_view(ErrorView)
        |> render("400.json", message: "You entered incorrect data.")
    end
  end

  def update(conn, %{"current_user" => current_user} = param) do
    with {:ok, attrs} <- ApplyParams.do_apply(UpdateUserParams, param),
         {:ok, user} <- Accounts.update_user(current_user, attrs) do
      render(conn, "update.json", %{user: user})
    else
      {:error, _} ->
        conn
        |> put_status(:bad_request)
        |> put_view(ErrorView)
        |> render("400.json", message: "You entered incorrect data.")
    end
  end
end
