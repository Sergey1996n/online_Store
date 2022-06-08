defmodule Online_Store.Wishlists.Commands.CreateWishlist do
  alias Online_Store.{
    Repo,
    Wishlists.Entities.Wishlist
  }

  def process(attrs) do
    %Wishlist{}
    # Ecto.build_assoc(user, :wishlist, %{})
    |> Wishlist.create_changeset(attrs)
    |> Repo.insert()
  end
end
