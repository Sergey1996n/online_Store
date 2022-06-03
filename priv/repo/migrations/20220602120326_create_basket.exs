defmodule Online_Store.Repo.Migrations.CreateBasket do
  use Ecto.Migration

  def change do
    create table(:baskets) do
      add :count, :integer
      add :user_id, references(:users)
    end

  create unique_index(:baskets, [:user_id])
  end
end
