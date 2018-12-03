defmodule Gist.Repo.Migrations.AddUsersGistsTables do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :uuid, primary_key: true
      add :email, :string
      add :username, :string
      add :password, :string
      add :password_hash, :string
      add :created_at, :utc_datetime
    end

    create unique_index(:users, [:user_id, :email, :username])
  end

end
