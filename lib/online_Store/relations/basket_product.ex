defmodule Online_Store.Relations.BasketProduct do
  use Ecto.Schema

  alias Online_Store.{
    Baskets.Entities.Basket,
    Products.Entities.Product
  }

  @primary_key false
  schema "baskets_products" do
    belongs_to :basket, Basket
    belongs_to :product, Product

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:basket_id, :product_id])
    |> Ecto.Changeset.validate_required([:basket_id, :product_id])
  end
end
