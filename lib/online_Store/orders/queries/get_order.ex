defmodule Online_Store.Orders.Queries.GetOrder do
  alias Online_Store.{
    Repo,
    Orders.Entities.Order
  }

  def process(id) do
    Repo.find(Order, id)
  end
end
