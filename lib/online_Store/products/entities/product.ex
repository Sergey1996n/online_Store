defmodule Online_Store.Products.Entities.Product do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Categories.Entities.Category,
    Wishlists.Entities.Wishlist,
    Baskets.Entities.Basket,
    Orders.Entities.Order,
    Relations.WishlistProduct,
    Relations.BasketProduct,
    Relations.OrderProduct
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
    many_to_many :baskets, Basket, join_through: BasketProduct
    many_to_many :orders, Order, join_through: OrderProduct

    timestamps()
  end

  def create_changeset(%__MODULE__{} = product, attrs) do
    product
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:title, message: "taken")
    |> assoc_constraint(:category)
  end

  def update_changeset(%__MODULE__{} = product, attrs) do
    product
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:title, message: "taken")
    |> assoc_constraint(:category)
  end
end
