defmodule Online_Store.Wishlists.Entities.Wishlist do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Products.Entities.Product,
    Accounts.Entities.User,
    Repo,
    Relations.WishlistProduct
  }

  @requires [
    :user_id
  ]

  schema "wishlists" do
    belongs_to :user, User

    many_to_many :products, Product, join_through: WishlistProduct, on_replace: :delete

    # timestamps()
  end

  def create_changeset(%__MODULE__{} = wishlist, attrs) do
    wishlist
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> assoc_constraint(:user)
  end

  def update_changeset(%__MODULE__{} = wishlist, attrs) do
    wishlist_preload = wishlist |> Repo.preload(:products)

    wishlist_preload
    |> change()
    |> put_assoc(:products, [attrs.products | wishlist_preload.products])
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> assoc_constraint(:user)
  end

  def delete_changeset(%__MODULE__{} = wishlist, attrs) do
    wishlist_preload = wishlist |> Repo.preload(:products)

    wishlist_preload
    |> change()
    |> delete_change(:products)
    |> put_assoc(:products, wishlist_preload.products -- [attrs.products])
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> assoc_constraint(:user)
  end
end
