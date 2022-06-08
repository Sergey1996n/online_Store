defmodule Online_StoreWeb.V1.WishlistController do
  use Online_StoreWeb, :controller

  alias Online_Store.Wishlists
  # alias Online_StoreWeb.V1.CharlistPolicy

  action_fallback(CharlistWeb.FallbackController)

  defmodule IndexWishlistParams do
    use Params.Schema, %{}
  end

  def index(conn, %{"current_user" => current_user} = params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexSearchParams, params) do
      page = Charlists.list_charlists(current_user, params)
      render(conn, "index.json", %{page: page})
    end
  end
end
