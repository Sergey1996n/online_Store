defmodule Online_StoreWeb.V1.OrderControllerTest do
  use Online_StoreWeb.ConnCase

  import Online_StoreWeb.Router.Helpers
  alias Online_Store.Baskets
  alias Online_Store.Repo
  alias Online_Store.Accounts

  setup %{conn: conn} do
    user = insert(:user, %{password: "testPassword1", balance: 1_000_000})
    conn = as_user(conn, user)
    list_product = insert_list(2, :product)
    basket = insert(:basket, %{user: user, products: list_product})
    {:ok, %{conn: conn, user: user, basket: basket}}
  end

  test "create/2 create order", %{conn: conn, user: user, basket: basket} do
    [product_1, product_2] = basket.products

    store = insert(:user, %{name: "store"})

    response =
      conn
      |> post(order_path(conn, :create), %{id: store.id})
      |> json_response(201)

    assert response == %{
             "order" => %{
               "products" => [
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
               "sum_price" => product_1.price + product_2.price
             }
           }

    {:ok, basket} = Baskets.get_basket(basket.id)
    assert Repo.preload(basket, :products).products == []

    {:ok, current_user} = Accounts.get_user(user.id)
    {:ok, store_qwe} = Accounts.get_user(store.id)
    assert user.balance - current_user.balance == product_1.price + product_2.price
    assert store_qwe.balance - store.balance == product_1.price + product_2.price
  end
end
