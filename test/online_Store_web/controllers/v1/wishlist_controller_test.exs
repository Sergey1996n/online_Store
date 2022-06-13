defmodule Online_StoreWeb.V1.WishlistControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers
  alias Online_Store.Wishlists

  setup %{conn: conn} do
    user = insert(:user, %{password: "testPassword1"})
    wishlist = insert(:wishlist, %{user: user})
    conn = as_user(conn, user)
    {:ok, %{conn: conn, wishlist: wishlist}}
  end

  test "show/2 returns list products wishlist", %{conn: conn, wishlist: wishlist} do
    [product_1, product_2] = insert_list(2, :product)
    {:ok, wishlist_update} = Wishlists.update_wishlist(wishlist, %{products: product_2})
    {:ok, wishlist_update} = Wishlists.update_wishlist(wishlist_update, %{products: product_1})
    attrs = %{page: 1, page_size: 10}

    response =
      conn
      |> get(wishlist_path(conn, :show, wishlist_update), attrs)
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

  test "update/2 update wishlist", %{conn: conn, wishlist: wishlist} do
    product = insert(:product)

    # Добавляем товар
    response =
      conn
      |> patch(wishlist_path(conn, :update, wishlist, %{product_id: product.id}))
      |> json_response(200)

    assert response == %{"count" => 1}

    # Удаляем товар
    response =
      conn
      |> patch(wishlist_path(conn, :update, wishlist, %{product_id: product.id}))
      |> json_response(200)

    assert response == %{"count" => 0}
  end
end
