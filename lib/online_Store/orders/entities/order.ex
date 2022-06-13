defmodule Online_Store.Orders.Entities.Order do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Products.Entities.Product,
    Accounts.Entities.User,
    Relations.OrderProduct,
    Orders
  }

  @requires [
    :user_id
    # :products
  ]

  schema "orders" do
    field :sum_price, :decimal
    belongs_to :user, User

    many_to_many :products, Product, join_through: OrderProduct
  end

  def create_changeset(%__MODULE__{} = order, attrs) do
    order
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> assoc_constraint(:user)
    |> put_assoc(:products, attrs.products)
    |> change(Orders.sum_price(attrs.products))
  end
end
