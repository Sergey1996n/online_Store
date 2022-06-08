defmodule Online_StoreWeb.V1.UserView do
  use Online_StoreWeb, :view

  def render("create.json", %{
        user: user,
        access_token: access_token,
        refresh_token: refresh_token
      }) do
    %{
      access_token: access_token,
      refresh_token: refresh_token,
      user: %{
        phone_number: user.phone_number
      }
    }
  end

  def render("update.json", %{user: user}) do
    %{
      user: %{
        phone_number: user.phone_number
      }
    }
  end
end
