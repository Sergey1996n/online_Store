defmodule Online_StoreWeb.V1.ProductControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers

  setup %{conn: conn} do
    # user = insert(:user)
    # conn = as_user(conn, user)
    {:ok, %{conn: conn}}
  end

  @tag :kek
  test "show/2 returns product", %{conn: conn} do
    product = insert(:product, %{category: insert(:category)})

    response =
      conn
      |> get(product_path(conn, :show, product.id))
      |> json_response(200)

    assert response ==
             %{
               "description" => product.description,
               "id" => product.id,
               "price" => product.price,
               "title" => product.title
             }
  end
end
