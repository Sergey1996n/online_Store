defmodule Online_Store.Orders.Queries.SumPrice do
  def process(products) do
    summa = Enum.reduce([0 | products], fn x, acc -> x.price + acc end)
    %{sum_price: summa}
  end
end
