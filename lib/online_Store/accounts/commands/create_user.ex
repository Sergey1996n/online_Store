defmodule Online_Store.Accounts.Commands.CreateUser do
    alias Online_Store.Repo
    alias Online_Store.Accounts.Entities.User

    def process(attrs) do
        %User{}
        |> User.create_
    end
