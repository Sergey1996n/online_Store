defmodule Online_StoreWeb.ErrorView do
  use Online_StoreWeb, :view

  alias Ecto.Changeset
  alias Online_Store.Changeset.Error

  def render("404.json", %{}) do
    %{errors: ["Not found"]}
  end

  def render("403.json", %{message: message}) do
    %{errors: [message]}
  end

  def render("401.json", %{error: %Error{} = error}) do
    %{errors: [Map.from_struct(error)]}
  end

  def render("422.json", %{changeset: %Changeset{errors: errors}}) do
    %{errors: convert_errors(errors)}
  end

  defp convert_errors(errors) do
    Enum.map(errors, fn {field, {details, _details}} ->
      %{field: field, code: details}
    end)
  end
end
