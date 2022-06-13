defmodule Online_Store.Orders.Queries.ListOrders do
  import Ecto.Query, only: [from: 2]

  alias Online_Store.{
    Repo,
    Orders.Entities.Order
  }

  def process(user_id, params) do
    Order
    |> by_user(user_id)
    |> Repo.paginate(params)
  end

  defp by_user(query, user_id) do
    from order in query,
      where: order.user_id == ^user_id
  end
end
