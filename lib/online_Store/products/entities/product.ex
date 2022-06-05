defmodule Online_Store.Products.Entities.Product do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Categories.Entities.Category,
    Wishlists.Entities.Wishlist,
    Baskets.Entities.Basket,
    Relations.WishlistProduct,
    Relations.BasketProduct
  }

  # alias Online_Store.Repo

  @required [
    :title,
    :description,
    :price,
    :category_id
  ]

  schema "products" do
    field :title, :string
    field :description, :string
    field :price, :integer

    belongs_to :category, Category

    many_to_many :wishlists, Wishlist, join_through: WishlistProduct
    many_to_many :products, Basket, join_through: BasketProduct

    timestamps()
  end

  def create_changeset(%__MODULE__{} = product, attrs) do
    product
    # |> Repo.preload(:wishlists)
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:title, message: "taken")
    |> assoc_constraint(:category)

    # |> put_assoc(:wishlists, [attrs.wishlists])
  end

  def update_changeset(%__MODULE__{} = product, attrs) do
    product
    # |> Repo.preload(:wishlists)
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:title, message: "taken")
    |> assoc_constraint(:category)

    # |> put_assoc(:wishlists, [attrs.wishlists])
  end
end
