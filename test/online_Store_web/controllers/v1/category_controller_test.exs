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
             %{"id" => category_3.id, "title" => category_3.title}
           ]
  end

  test "show/2 returns list products category", %{conn: conn} do
    [category_1, category_2] = insert_list(2, :category)
    [product_1, product_2] = insert_list(2, :product, %{category: category_1})
    insert_list(2, :product, %{category: category_2})

    [product_1, product_2] = Enum.sort_by([product_1, product_2], fn p -> p.price end)

    response =
      conn
      |> get(category_path(conn, :show, category_1))
      |> json_response(200)

    assert response == [
             %{
               "description" => product_1.description,
               "id" => product_1.id,
               "price" => product_1.price,
               "title" => product_1.title
             },
             %{
               "description" => product_2.description,
               "id" => product_2.id,
               "price" => product_2.price,
               "title" => product_2.title
             }
           ]
  end

  test "show/2 returns list products category sort", %{conn: conn} do
    category = insert(:category)
    list_products = insert_list(5, :product, %{category: category})

    list_products = Enum.sort_by(list_products, fn p -> -p.price end)
    [product_1, product_2, product_3, product_4, product_5] = list_products

    response =
      conn
      |> get(category_path(conn, :show, category, %{order: 1}))
      |> json_response(200)

    assert response == [
             %{
               "description" => product_1.description,
               "id" => product_1.id,
               "price" => product_1.price,
               "title" => product_1.title
             },
             %{
               "description" => product_2.description,
               "id" => product_2.id,
               "price" => product_2.price,
               "title" => product_2.title
             },
             %{
               "description" => product_3.description,
               "id" => product_3.id,
               "price" => product_3.price,
               "title" => product_3.title
             },
             %{
               "description" => product_4.description,
               "id" => product_4.id,
               "price" => product_4.price,
               "title" => product_4.title
             },
             %{
               "description" => product_5.description,
               "id" => product_5.id,
               "price" => product_5.price,
               "title" => product_5.title
             }
           ]

    list_products =
      Enum.sort_by(list_products, fn p -> p.title end)

    [product_1, product_2, product_3, product_4, product_5] = list_products

    response =
      conn
      |> get(category_path(conn, :show, category, %{order: 2}))
      |> json_response(200)

    assert response == [
             %{
               "description" => product_1.description,
               "id" => product_1.id,
               "price" => product_1.price,
               "title" => product_1.title
             },
             %{
               "description" => product_2.description,
               "id" => product_2.id,
               "price" => product_2.price,
               "title" => product_2.title
             },
             %{
               "description" => product_3.description,
               "id" => product_3.id,
               "price" => product_3.price,
               "title" => product_3.title
             },
             %{
               "description" => product_4.description,
               "id" => product_4.id,
               "price" => product_4.price,
               "title" => product_4.title
             },
             %{
               "description" => product_5.description,
               "id" => product_5.id,
               "price" => product_5.price,
               "title" => product_5.title
             }
           ]
  end

  @tag :kek
  test "show/2 returns list products category filter", %{conn: conn} do
    category = insert(:category)
    product_1 = insert(:product, %{category: category, price: 10000})
    product_2 = insert(:product, %{category: category, price: 20000})
    product_3 = insert(:product, %{category: category, price: 30000})
    product_4 = insert(:product, %{category: category, price: 40000})
    product_5 = insert(:product, %{category: category, price: 50000})

    response =
      conn
      |> get(category_path(conn, :show, category, %{from: 30000, to: 40000}))
      |> json_response(200)

      assert response == [
        %{
          "description" => product_3.description,
          "id" => product_3.id,
          "price" => product_3.price,
          "title" => product_3.title
        },
        %{
          "description" => product_4.description,
          "id" => product_4.id,
          "price" => product_4.price,
          "title" => product_4.title
        },
      ]

      response =
        conn
        |> get(category_path(conn, :show, category, %{from: 40000}))
        |> json_response(200)

        assert response == [
          %{
            "description" => product_4.description,
            "id" => product_4.id,
            "price" => product_4.price,
            "title" => product_4.title
          },
          %{
            "description" => product_5.description,
            "id" => product_5.id,
            "price" => product_5.price,
            "title" => product_5.title
          }
        ]
        response =
          conn
          |> get(category_path(conn, :show, category, %{to: 20000}))
          |> json_response(200)

          assert response == [
            %{
              "description" => product_1.description,
              "id" => product_1.id,
              "price" => product_1.price,
              "title" => product_1.title
            },
            %{
              "description" => product_2.description,
              "id" => product_2.id,
              "price" => product_2.price,
              "title" => product_2.title
            }
          ]
  end
end
