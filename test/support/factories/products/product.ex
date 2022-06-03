defmodule Online_Store.Factories.Products.ProductFactory do
  defmacro __using__(_opts) do
    quote do
      alias Faker.{Lorem, Random, Phone, Date}
      alias Online_Store.Products.Entities.Product
      alias Online_Store.DataCase

      def product_factory(attrs) do
        title = Map.get(attrs, :title, Lorem.word())
        description = Map.get(attrs, :description, Lorem.sentence())
        price = Map.get(attrs, :price, Enum.random(1000..100000))
        category = Map.get(attrs, :category, insert(:category))
        %Product{
          title: title,
          description: description,
          price: price,
          category: category,
        }
      end
    end
  end
end
