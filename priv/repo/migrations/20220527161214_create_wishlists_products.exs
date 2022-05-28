defmodule Online_Store.Repo.Migrations.CreateWishlistsProducts do
  use Ecto.Migration

  def change do
    create table(:wishlists_products) do
      add :wishlist_id, references(:wishlists)
      add :product_id, references(:products)

      timestamps()
    end

    create unique_index(:wishlists_products, [:wishlist_id, :product_id])
  end
end
