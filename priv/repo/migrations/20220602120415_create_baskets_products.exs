defmodule Online_Store.Repo.Migrations.CreateBasketsProducts do
  use Ecto.Migration

  def change do
    create table(:baskets_products) do
      add :basket_id, references(:baskets)
      add :product_id, references(:products)

      timestamps()
    end

    create unique_index(:baskets_products, [:basket_id, :product_id])
  end
end
