defmodule Online_Store.Categories do
  alias Online_Store.Categories.Commands.{
    CreateCategory,
    DeleteCategory,
    UpdateCategory
  }

  alias Online_Store.Categories.Queries.{
    GetCategory,
    ListCategory
  }

  # Commands
  defdelegate create_category(attrs), to: CreateCategory, as: :process
  defdelegate delete_category(category), to: DeleteCategory, as: :process
  defdelegate update_category(category, atrrs), to: UpdateCategory, as: :process

  # Queries
  defdelegate get_category(id), to: GetCategory, as: :process
  defdelegate list_category(), to: ListCategory, as: :process
end
