defmodule Online_Store.Wishlists.Entities.Wishlist do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Products.Entities.Product,
    Accounts.Entities.User,
    Repo
  }

  @requires [
    :user_id,
  ]

  schema "wishlists" do
    belongs_to :user, User

    many_to_many :products, Product, join_through: "wishlists_products"

    # timestamps()
  end

  def create_changeset(%__MODULE__{} = wishlist, attrs) do
    wishlist
    |> Repo.preload(:products)
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> assoc_constraint(:user)
    |> put_assoc(:products, [attrs.products])
  end

  def update_changeset(%__MODULE__{} = wishlist, attrs) do
    wishlist
    |> Repo.preload(:products)
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> assoc_constraint(:user)
    |> put_assoc(:products, [attrs.products])
  end
end
