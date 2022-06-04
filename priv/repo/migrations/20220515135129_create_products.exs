defmodule Online_Store.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string, null: false
      add :description, :string, null: false
      add :price, :integer, null: false
      add :category_id, references(:categories)

      timestamps()
    end

    create unique_index(:products, [:title])
  end
end
