defmodule Online_Store.Accounts.Entities.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Wishlists.Entities.Wishlist,
    # Repo
  }

  schema "users" do
    field :phone_number, :string
    field :email, :string
    field :name, :string
    field :surname, :string
    field :nickname, :string
    field :birthday, :date
    field :password, :string, virtual: true
    field :password_hash, :string

    has_one :wishlist, Wishlist

    timestamps()
  end

  def create_changeset(%__MODULE__{} = user, attrs) do
    user
    # |> Repo.preload(:product)
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
    |> validate_format(:password, ~r/^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}/,
      message: "invalid_format"
    )
    # |> put_password_hash()
    |> assoc_constraint(:wishlist)
    # Уточнить за ограничения :birthday
  end

  def update_changeset(%__MODULE__{} = user, attrs) do
    user
    # |> Repo.preload(:product)
    |>cast(attrs, [:phone_number, :email, :name, :surname, :nickname, :birthday])
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
    |> validate_format(:password, ~r/^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}/,
      message: "invalid_format"
    )
    # |> put_password_hash()
    |> assoc_constraint(:wishlist)
  end

  # defp put_password_hash(%{valid?: true, changes: %{password: password}} = changeset) do
  #   # change(changeset, Argon2.add_hash(password))
  # end

  # defp put_password_hash(changeset), do: changeset
end
