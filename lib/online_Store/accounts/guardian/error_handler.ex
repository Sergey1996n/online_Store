defmodule Online_Store.Accounts.Guardian.ErrorHandler do
  use Online_StoreWeb, :controller

  alias Online_Store.Changeset.Error
  alias Online_StoreWeb.ErrorView

  def auth_error(conn, {type, _reason}, _opts) do
    error =
      type
      |> to_string()
      |> Error.auth_error()

    conn
    |> put_status(401)
    |> put_view(ErrorView)
    |> render("401.json", error: error)
  end
end
