defmodule Example.Movie do
  use Ecto.Schema

  schema "movies" do
    field(:title, :string)
    field(:tagline, :string)
    has_many(:characters, Example.Character)
    has_one(:distributor, Example.Distributor)
  end
end
