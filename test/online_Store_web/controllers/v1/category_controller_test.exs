defmodule Online_StoreWeb.V1.CategoryControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers

  setup %{conn: conn} do
    {:ok, %{conn: conn}}
  end

  test "index/2 returns list categories", %{conn: conn} do
    [category_1, category_2, category_3] = insert_list(3, :category)

    response =
      conn
      |> get(category_path(conn, :index))
      |> json_response(200)

    assert response == [
      %{"id" => category_1.id, "title" => category_1.title},
      %{"id" => category_2.id, "title" => category_2.title},
      %{"id" => category_3.id, "title" => category_3.title},
    ]
  end

  @tag :kek
  test "show/2 returns list products category", %{conn: conn} do
    [category_1, category_2] = insert_list(2, :category)
    [product_1, product_2] = insert_list(2, :product, %{category: category_1})
    insert_list(2, :product, %{category: category_2})

    response =
      conn
      |> get(category_path(conn, :show, category_1.id))
      |> json_response(200)

    assert response == [
      %{"description" => product_1.description, "id" => product_1.id, "price" => product_1.price, "title" => product_1.title},
      %{"description" => product_2.description, "id" => product_2.id, "price" => product_2.price, "title" => product_2.title},
    ]

  end
end
