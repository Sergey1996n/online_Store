defmodule Online_Store.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :phone_number, :string, null: false
      add :email, :string
      add :name, :string
      add :surname, :string
      add :nickname, :string
      add :birthday, :date
      add :password_hash, :string
      add :balance, :integer

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
