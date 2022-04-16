defmodule Online_StoreWeb.PageController do
  use Online_StoreWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
