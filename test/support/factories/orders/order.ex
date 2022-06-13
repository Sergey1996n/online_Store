defmodule Online_Store.Factories.Orders.OrderFactory do
  defmacro __using__(_opts) do
    quote do
      alias Online_Store.Orders.Entities.Order
      alias Online_Store.DataCase
      alias Online_Store.Accounts

      def order_factory(attrs) do
        user = Map.get(attrs, :user, insert(:user))
        products = Map.get(attrs, :products, insert_list(3, :product))
        sum_price = Map.get(attrs, :sum_price, Enum.random(10000..100_000))

        %Order{
          user: user,
          products: products,
          sum_price: sum_price
        }
      end
    end
  end
end
