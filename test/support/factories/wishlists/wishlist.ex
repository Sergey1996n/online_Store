defmodule Online_Store.Factories.Wishlists.WishlistFactory do
  defmacro __using__(_opts) do
    quote do
      alias Faker.{Lorem, Random, Phone, Date}
      alias Online_Store.Wishlists.Entities.Wishlist
      alias Online_Store.DataCase
      alias Online_Store.Accounts
      alias Online_Store.Products
      alias Online_Store.Categories

      def wishlist_factory(attrs) do
        user = Map.get(attrs, :user, insert(:user))
        # user = insert(:user)
        # category = insert(:category)
        # product = insert(:product)
        product = Map.get(attrs, :product, insert(:product))
        %Wishlist{
          user: user,
          user_id: user.id,
          products: product
        }
      end
    end
  end
end
