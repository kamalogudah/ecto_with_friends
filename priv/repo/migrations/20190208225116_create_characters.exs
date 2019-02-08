defmodule Example.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create_table(:characters) do
      add(:name, :string)
      add(:movie_id, references(:movies))
    end
  end
end