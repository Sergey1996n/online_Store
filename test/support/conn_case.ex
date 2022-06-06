defmodule Online_StoreWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use Online_StoreWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import Online_StoreWeb.ConnCase
      import Online_Store.DataCase
      import Online_Store.Factories

      alias Online_Store.Accounts.{
        Entities.User,
        Services.Guardian
      }

      alias Online_StoreWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint Online_StoreWeb.Endpoint

      def as_user(conn, %User{} = user) do
        {:ok, token, _} = Guardian.encode_and_sign(user, %{}, token_type: :access)

        Plug.Conn.put_req_header(conn, "authorization", "bearer: " <> token)
      end
    end
  end

  setup tags do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(Online_Store.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
