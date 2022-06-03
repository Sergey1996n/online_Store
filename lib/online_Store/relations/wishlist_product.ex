defmodule Online_Store.Relations.WishlistProduct do
  use Ecto.Schema

  alias Online_Store.{
    Wishlists.Entities.Wishlist,
    Products.Entities.Product
  }

  @primary_key false
  schema "wishlists_products" do
    belongs_to :wishlist, Wishlist
    belongs_to :product, Product

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:wishlist_id, :product_id])
    |> Ecto.Changeset.validate_required([:wishlist_id, :product_id])
  end
end
