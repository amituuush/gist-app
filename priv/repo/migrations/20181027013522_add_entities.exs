defmodule Gist.Repo.Migrations.AddEntities do
  use Ecto.Migration

  def change do
    create table(:gist) do
      add :title, :string
    end
  end
end
