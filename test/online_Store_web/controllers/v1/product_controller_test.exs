defmodule Online_StoreWeb.V1.ProductControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers

  setup %{conn: conn} do
    {:ok, %{conn: conn}}
  end

  test "index/2 returns list products", %{conn: conn} do
    [product_1, product_2, product_3] = insert_list(3, :item)

    # response =
    #   conn
    #   |> get(item_path(conn, :product))
    #   |> json_response(200)
    #   |> IO.inspect()
  end
end
