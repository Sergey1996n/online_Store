defmodule Online_Store.Factories.Categories.CategoryFactory do
  defmacro __using__(_opts) do
    quote do
      alias Faker.{Internet, Lorem, Person, Phone, Date}
      alias Online_Store.Categories.Entities.Category

      def category_factory(attrs) do
        title = Map.get(attrs, :title, Lorem.word())
        %Category{
          title: sequence(:title, &"#{&1}_#{title}"),
        }
      end
    end
  end
end
