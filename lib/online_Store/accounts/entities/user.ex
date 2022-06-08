defmodule Online_Store.Accounts.Entities.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Wishlists.Entities.Wishlist,
    Baskets.Entities.Basket
    # Repo
  }

  @requires [
    :phone_number,
    :password
  ]

  @options [
    :email,
    :name,
    :surname,
    :nickname,
    :birthday,
    :password_hash
  ]

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
    has_one :basket, Basket

    timestamps()
  end

  def create_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, @requires ++ @options)
    |> validate_required(@requires)
    |> validate_format(:phone_number, ~r/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/,
      message: "invalid_format"
    )
    |> unique_constraint(:phone_number)
    |> validate_format(
      :email,
      ~r/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u,
      message: "invalid_format"
    )
    |> unique_constraint(:email)
    |> unique_constraint(:nickname)
    |> validate_format(:password, ~r/^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}/,
      message: "invalid_format"
    )

    # |> put_password_hash()
  end

  def update_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, @requires ++ @options)
    # Спросить за :nickname
    |> validate_format(:phone_number, ~r/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/,
      message: "invalid_format"
    )
    |> unique_constraint(:phone_number)
    |> validate_format(
      :email,
      ~r/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u,
      message: "invalid_format"
    )
    |> unique_constraint(:email)
    |> unique_constraint(:nickname)
    |> validate_format(:password, ~r/^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}/,
      message: "invalid_format"
    )

    # |> put_password_hash()
  end

  # defp put_password_hash(%{valid?: true, changes: %{password: password}} = changeset) do
  #   # change(changeset, Argon2.add_hash(password))
  # end

  # defp put_password_hash(changeset), do: changeset
end
