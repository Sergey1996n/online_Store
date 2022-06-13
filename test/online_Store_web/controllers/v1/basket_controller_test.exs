defmodule Online_StoreWeb.V1.BasketControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers
  alias Online_Store.Baskets

  setup %{conn: conn} do
    user = insert(:user, %{password: "testPassword1"})
    basket = insert(:basket, %{user: user})
    conn = as_user(conn, user)
    {:ok, %{conn: conn, basket: basket}}
  end

  test "show/2 returns list products basket", %{conn: conn, basket: basket} do
    [product_1, product_2] = insert_list(2, :product)

    [product_1, product_2] = Enum.sort_by([product_1, product_2], fn p -> p.price end)

    {:ok, basket_update} =
      basket
      |> Baskets.update_basket(%{products: product_1})

    {:ok, basket_update} =
      basket_update
      |> Baskets.update_basket(%{products: product_2})

    attrs = %{page: 1, page_size: 10}

    response =
      conn
      |> get(basket_path(conn, :show, basket_update), attrs)
      |> json_response(200)

    assert response == %{
             "entries" => [
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
             ],
             "page_number" => 1,
             "page_size" => 10,
             "total_entries" => 2,
             "total_pages" => 1
           }
  end

  @tag :kek
  test "update/2 update basket", %{conn: conn, basket: basket} do
    product = insert(:product)

    # Добавляем товар
    response =
      conn
      |> patch(basket_path(conn, :update, basket, %{product_id: product.id}))
      |> json_response(200)

    assert response == %{"count" => 1, "sum_price" => product.price}

    # Удаляем товар
    response =
      conn
      |> patch(basket_path(conn, :update, basket, %{product_id: product.id}))
      |> json_response(200)

    assert response == %{"count" => 0, "sum_price" => 0}
  end
end
