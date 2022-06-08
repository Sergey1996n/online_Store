defmodule Online_StoreWeb.CurrentUserPlug do
  import Plug.Conn

  alias Online_Store.Accounts.Services.Guardian

  def init(opts), do: opts

  def call(%Plug.Conn{params: params} = conn, _opts) do
    IO.inspect("123")

    case Guardian.current_user(conn) do
      {:ok, user} ->
        %{conn | params: Map.put(params, "current_user", user)}

      _ ->
        conn
        |> send_resp(401, "Access denied")
        |> halt()
    end
  end
end
