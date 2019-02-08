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
    |> validate_fictional_name()
  end

  @fictional_names ["Black Panther", "Wonder Woman", "Spiderman"]
  def validate_fictional_name(changeset) do
    name = get_field(changeset, :name)

    if name in @fictional_names do
      changeset
    else
      add_error(changeset, :name, "is not a superhero")
    end
  end
end
