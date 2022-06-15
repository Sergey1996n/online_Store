defmodule Online_StoreWeb.V1.CategoryController do
  use Online_StoreWeb, :controller

  alias Online_Store.Categories
  alias Online_Store.Products
  alias Online_StoreWeb.ApplyParams
  alias Ecto.Changeset

  action_fallback(Online_StoreWeb.FallbackController)

  defmodule ShowCategoryParams do
    use Params.Schema, %{
      order: :integer,
      from: :integer,
      to: :integer,
      page: :integer,
      page_size: :integer
    }
  end

  def index(conn, _params) do
    categories = Categories.list_category()
    render(conn, "index.json", %{categories: categories})
  end

  def show(conn, %{"id" => category_id} = params) do
    with {:ok, params} <- ApplyParams.do_apply(ShowCategoryParams, params) do
      page = Products.list_products_category(category_id, params)
      render(conn, "index_product.json", %{page: page})
    else
      {:error, %Changeset{} = changeset} ->
        with %Changeset{errors: errors} <- changeset,
             params <- convert_errors(params, errors) do
          {:ok, params} = ApplyParams.do_apply(ShowCategoryParams, params)
          page = Products.list_products_category(category_id, params)
          render(conn, "index_product.json", %{page: page})
        end
    end
  end

  defp convert_errors(params, errors) do
    fields = Enum.map(errors, fn {field, _} -> to_string(field) end)
    Map.drop(params, fields)
  end
end
