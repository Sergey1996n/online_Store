defmodule Online_Store.Baskets.Entities.Basket do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Products.Entities.Product,
    Accounts.Entities.User,
    Repo,
    Relations.BasketProduct
  }

  @requires [
    :user_id,
  ]

  schema "baskets" do
    field :count, :integer
    belongs_to :user, User

    many_to_many :products, Product, join_through: BasketProduct

    # timestamps()
  end

  def create_changeset(%__MODULE__{} = basket, attrs) do
    basket
    |> Repo.preload(:products)
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> validate_number(:count, greater_than_or_equal_to: 1)
    |> assoc_constraint(:user)
    |> put_assoc(:products, [attrs.products])
  end

  def update_changeset(%__MODULE__{} = basket, attrs) do
    basket
    |> Repo.preload(:products)
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> validate_number(:count, greater_than_or_equal_to: 1)
    |> assoc_constraint(:user)
    |> put_assoc(:products, [attrs.products])
  end
end
