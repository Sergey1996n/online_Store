defmodule Online_Store.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :phone_number, :string
      add :email, :string, null: false
      add :name, :string
      add :surname, :string
      add :nickname, :string
      add :birthday, :date
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
