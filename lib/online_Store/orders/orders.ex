defmodule Online_Store.Orders do
  alias Online_Store.Orders.Commands.{
    CreateOrder
  }

  alias Online_Store.Orders.Queries.{
    GetOrder,
    ListOrders,
    SumPrice
  }

  defdelegate create_order(attrs), to: CreateOrder, as: :process

  defdelegate get_order(id), to: GetOrder, as: :process
  defdelegate list_orders(user_id, params \\ %{}), to: ListOrders, as: :process
  defdelegate sum_price(products), to: SumPrice, as: :process
end
