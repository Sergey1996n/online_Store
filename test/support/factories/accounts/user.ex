defmodule Online_Store.Factories.Accounts.UserFactory do
  defmacro __using__(_opts) do
    quote do
      alias Faker.{Internet, Lorem, Person, Phone, Date}
      alias Online_Store.Accounts.Entities.User

      def user_factory(attrs) do
        password = Map.get(attrs, :password, Lorem.characters(8..16))
        email = Map.get(attrs, :email, Internet.email())
        phone_number = Map.get(attrs, :phone_number, Phone.EnUs.extension(11))
        birthday = Map.get(attrs, :birthday, Date.date_of_birth(18..99))
        balance = Map.get(attrs, :balance, Enum.random(0..100))
        name = Map.get(attrs, :name, nil)

        %User{
          password: password,
          email: sequence(:email, &"#{&1}_#{email}"),
          phone_number: phone_number,
          birthday: birthday,
          balance: balance,
          name: name
        }
      end
    end
  end
end
