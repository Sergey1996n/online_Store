defmodule Online_Store.Repo.Migrations.CreateWishlists do
  use Ecto.Migration

  def change do
    create table(:wishlists) do
      add :user_id, references(:users)
    end

    create unique_index(:wishlists, [:user_id])
  end
end
