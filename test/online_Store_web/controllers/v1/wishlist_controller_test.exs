defmodule Online_StoreWeb.V1.WishlistControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers
  alias Online_Store.Wishlists

  setup %{conn: conn} do
    user = insert(:user, %{password: "testPassword1"})
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  test "show/2 returns list products wishlist", %{conn: conn, user: user} do
    wishlist = insert(:wishlist, %{user: user})
    [product_1, product_2] = insert_list(2, :product)

    [product_1, product_2] = Enum.sort_by([product_1, product_2], fn p -> p.price end)

    {:ok, wishlist_update} =
      wishlist
      |> Wishlists.update_wishlist(%{products: product_1})

    {:ok, wishlist_update} =
      wishlist_update
      |> Wishlists.update_wishlist(%{products: product_2})

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
end
