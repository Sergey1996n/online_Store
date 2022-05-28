defmodule Online_Store.Factories do
  use ExMachina.Ecto, repo: Online_Store.Repo

  use Online_Store.Factories.{
    Accounts.UserFactory,
    Categories.CategoryFactory,
    Products.ProductFactory,
    Wishlists.WishlistFactory
  }
end
