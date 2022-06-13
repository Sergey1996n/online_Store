defmodule Online_Store.Baskets do
  alias Online_Store.Baskets.Commands.{
    CreateBasket,
    UpdateBasket,
    DeleteProductBasket,
    ClearProductsBasket
  }

  alias Online_Store.Baskets.Queries.{
    GetBasket,
    ListBaskets,
    GetBasketUser
  }

  # Commands
  defdelegate create_basket(attrs), to: CreateBasket, as: :process
  defdelegate update_basket(basket, attrs), to: UpdateBasket, as: :process
  defdelegate delete_product(basket, attrs), to: DeleteProductBasket, as: :process
  defdelegate clear_products(basket), to: ClearProductsBasket, as: :process

  # Queries
  defdelegate get_basket(id), to: GetBasket, as: :process
  defdelegate list_baskets(), to: ListBaskets, as: :process
  defdelegate get_basket_user(user_id), to: GetBasketUser, as: :process
end
