defmodule Gist.Repo.Migrations.UpdateGistTable do
  use Ecto.Migration

    def change do
      alter table(:gist) do
        add :created_at, :utc_datetime
      end
    end


end
