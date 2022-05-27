defmodule Online_Store.Products.Entities.Product do
  use Ecto.Schema

  import Ecto.Changeset

  alias Online_Store.{
    Categories.Entities.Category,
    # Repo
  }
  # alias Online_Store.Repo

  @required  [
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

    timestamps()
  end

  def create_changeset(%__MODULE__{} = product, attrs) do
    product
    # |> Repo.preload(:categories)
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:title, message: "taken")
    |> assoc_constraint(:category)
  end

  def update_changeset(%__MODULE__{} = product, attrs) do
    product
    # |> Repo.preload(:categories)
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:title, message: "taken")
    |> assoc_constraint(:category)
  end
end
