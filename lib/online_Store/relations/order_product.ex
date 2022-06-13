defmodule Online_Store.Relations.OrderProduct do
  use Ecto.Schema

  alias Online_Store.{
    Orders.Entities.Order,
    Products.Entities.Product
  }

  @primary_key false
  schema "orders_products" do
    belongs_to :order, Order
    belongs_to :product, Product

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:order_id, :product_id])
    |> Ecto.Changeset.validate_required([:order_id, :product_id])
  end
end
