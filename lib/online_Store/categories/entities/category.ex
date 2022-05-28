defmodule Online_Store.Categories.Entities.Category do
  use Ecto.Schema

  import Ecto.Changeset

  # alias Online_Store.Repo
  alias Online_Store.Products.Entities.Product

  @requires [
    :title
  ]

  schema "categories" do
    field :title, :string
    has_many :products, Product
    timestamps()
  end

  def create_changeset(%__MODULE__{} = category, attrs) do
    category
    # |> Repo.preload(:products)
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> unique_constraint(:title, message: "taken")
  end

  def update_changeset(%__MODULE__{} = category, attrs) do
    category
    # |> Repo.preload(:products)
    |> cast(attrs, @requires)
    |> validate_required(@requires)
    |> unique_constraint(:title, message: "taken")
  end
end
