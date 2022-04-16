defmodule Online_Store.Accounts.Entities.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :phone_number, :string
    field :email, :string
    field :name, :string
    field :surname, :string
    field :nickname, :string
    field :birthday, :date

    timestamps()
  end

  def create_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [:phone_number, :email, :name, :surname, :nickname, :birthday])
    # Спросить за :nickname
    |> validate_required([:phone_number, :birthday])
    |> validate_format(:phone_number, ~r/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/,
    message: "invalid_format"
    )
    |> unique_constraint(:phone_number)
    |> validate_format(:email, ~r/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u,
    message: "invalid_format"
    )
    |> unique_constraint(:email)
    |> unique_constraint(:nickname)
    # Уточнить за ограничения :birthday
  end
end
