defmodule Example.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field(:name, :string)
    field(:age, :integer, default: 1)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :age])
    |> validate_required([:name, :age])
    |> validate_length(:name, min: 2)
    |> validate_inclusion(:age, 1..130)
  end
end
