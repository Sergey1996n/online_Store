defmodule CategoryProduct do
  use Ecto.Schema

  alias Online_Store.{
    Categories.Entities.Category,
    Products.Entities.Product
  }

  schema "categories_products" do
    belongs_to :category, Category
    belongs_to :product, Product

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:category_id, :product_id])
    |> Ecto.Changeset.validate_required([:category_id, :product_id])
  end
end
