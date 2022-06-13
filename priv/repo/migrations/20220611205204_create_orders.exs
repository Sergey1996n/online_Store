defmodule Online_Store.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :sum_price, :decimal
      add :user_id, references(:users)
    end

    create unique_index(:orders, [:user_id, :sum_price])
  end
end
