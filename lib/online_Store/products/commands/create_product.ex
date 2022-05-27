defmodule Online_Store.Products.Commands.CreateProduct do
  alias Online_Store.{
    Repo,
    Products.Entities.Product
  }

  @spec process(:invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) ::
          any
  def process(attrs) do
    %Product{}
    |> Product.create_changeset(attrs)
    |> Repo.insert()
  end
end
