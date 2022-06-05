defmodule Online_Store.Products do
  alias Online_Store.Products.Commands.{
    CreateProduct,
    DeleteProduct,
    UpdateProduct
  }

  alias Online_Store.Products.Queries.{
    GetProduct,
    ListProducts,
    ListProductsCategory
  }

  # Commands
  defdelegate create_product(attrs), to: CreateProduct, as: :process
  defdelegate delete_product(product), to: DeleteProduct, as: :process
  defdelegate update_product(product, attrs), to: UpdateProduct, as: :process

  # Queries
  defdelegate get_product(id), to: GetProduct, as: :process
  defdelegate list_products(), to: ListProducts, as: :process

  defdelegate list_products_category(category_id, param \\ %{}),
    to: ListProductsCategory,
    as: :process
end
