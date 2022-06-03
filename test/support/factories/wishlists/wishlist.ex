defmodule Online_Store.Factories.Wishlists.WishlistFactory do
  defmacro __using__(_opts) do
    quote do
      alias Online_Store.Wishlists.Entities.Wishlist
      alias Online_Store.DataCase
      alias Online_Store.Accounts

      def wishlist_factory(attrs) do
        user = Map.get(attrs, :user, insert(:user))
        %Wishlist{
          user: user,
        }
      end
    end
  end
end
