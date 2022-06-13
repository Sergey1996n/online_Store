defmodule Online_Store.Orders.Commands.CreateOrder do
  alias Online_Store.{
    Repo,
    Orders.Entities.Order
  }

  def process(attrs) do
    %Order{}
    |> Order.create_changeset(attrs)
    |> Repo.insert()
  end
end
