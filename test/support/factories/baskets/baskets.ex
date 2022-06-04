defmodule Online_Store.Factories.Baskets.BasketFactory do
  defmacro __using__(_opts) do
    quote do
      # alias Faker.{Lorem, Random, Phone, Date}
      alias Online_Store.Baskets.Entities.Basket
      alias Online_Store.DataCase
      # alias Online_Store.Accounts

      def basket_factory(attrs) do
        user = Map.get(attrs, :user, insert(:user))
        count = Map.get(attrs, :count, Enum.random(1..10))

        %Basket{
          user: user,
          count: count
        }
      end
    end
  end
end
