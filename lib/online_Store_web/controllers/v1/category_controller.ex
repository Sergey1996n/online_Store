defmodule Online_StoreWeb.V1.CategoryController do
  use Online_StoreWeb, :controller

  alias Online_Store.Categories
  alias Online_Store.Products
  alias Online_StoreWeb.ApplyParams
  # alias Online_StoreWeb.V1.CharlistPolicy

  action_fallback(Online_StoreWeb.FallbackController)

  defmodule IndexSearchParams do
    use Params.Schema, %{
      order: :integer,
      from: :integer,
      to: :integer
      # charisma: :integer,
      # constitution: :integer,
      # intelligence: :integer,
      # nickname: :string,
      # page!: :integer,
      # page_size!: :integer
    }
  end

  # Нужен ли _params
  def index(conn, _params) do
    categories = Categories.list_category()
    render(conn, "index.json", %{categories: categories})
  end

  # def show(conn, %{"id" => category_id}, params) do
  #   # Products.list_products_category(id)
  #   # params |> IO.inspect()
  #   products = Products.list_products_category(category_id, params)
  #   render(conn, "index_product.json", %{products: products})
  # end

  def show(conn, %{"id" => category_id} = params) do
    # Products.list_products_category(id)
    # params |> IO.inspect()
    with {:ok, params} <- ApplyParams.do_apply(IndexSearchParams, params) do
      products = Products.list_products_category(category_id, params)
      render(conn, "index_product.json", %{products: products})
    end
  end
end
