defmodule Gist.Repo.Migrations.AddUsersAndGistsTables do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :binary_id, primary_key: true
      add :email, :string
      add :username, :string
      add :password, :string
      add :password_hash, :string
      add :created_at, :utc_datetime
    end

    create unique_index(:users, [:user_id, :email, :username])

    create table(:gists, primary_key: false) do
      add :gist_id, :binary_id, primary_key: true
      add :user_id, references(:users, column: :user_id, type: :uuid), null: false
      add :title, :string
      add :description, :string
      add :created_at, :utc_datetime
    end

    create unique_index(:gists, [:gist_id, :user_id])
  end
end
