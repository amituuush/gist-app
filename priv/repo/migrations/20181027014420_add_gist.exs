defmodule Gist.Repo.Migrations.AddGist do
  use Ecto.Migration

  def change do
    create table(:gist) do
      add :title, :string
      add :description, :string
    end
  end
end
