defmodule Online_Store.Store.Entities.Store do
  use Ecto.Schema

  schema "store" do
    field :balance, :integer
  end
end
