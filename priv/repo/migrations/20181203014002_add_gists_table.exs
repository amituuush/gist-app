defmodule Gist.Repo.Migrations.AddGistsTable do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:user_id, :username, :email], name: :user_id_index)

    create table(:gists) do
      add :gist_id, :uuid, primary_key: true
      add :user_id, references(:users, column: :user_id), null: false
      add :title, :string
      add :description, :string
      add :created_at, :utc_datetime
    end

    create unique_index(:gists, [:gist_id, :user_id])
  end
end
