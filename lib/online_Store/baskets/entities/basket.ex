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
    :user_id
  ]

  @options [
    :count
  ]

  schema "baskets" do
    field :count, :integer
    belongs_to :user, User

    many_to_many :products, Product, join_through: BasketProduct, on_replace: :delete

    # timestamps()
  end

  def create_changeset(%__MODULE__{} = basket, attrs) do
    basket
    |> cast(attrs, @requires ++ @options)
    |> validate_required(@requires)
    |> assoc_constraint(:user)
  end

  def update_changeset(%__MODULE__{} = basket, attrs) do
    basket_preload = basket |> Repo.preload(:products)

    basket_preload
    |> change()
    |> put_assoc(:products, [attrs.products | basket_preload.products])
    |> cast(attrs, @requires ++ @options)
    |> validate_required(@requires)
    |> validate_number(:count, greater_than_or_equal_to: 1)
    |> assoc_constraint(:user)
  end

  def delete_changeset(%__MODULE__{} = basket, attrs) do
    basket_preload = basket |> Repo.preload(:products)

    basket_preload
    |> change()
    |> delete_change(:products)
    |> put_assoc(:products, basket_preload.products -- [attrs.products])
    |> assoc_constraint(:user)
  end

  def clear_product_changeset(%__MODULE__{} = basket) do
    basket
    |> change()
    |> put_assoc(:products, [])
  end
end
