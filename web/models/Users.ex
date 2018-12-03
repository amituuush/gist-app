defmodule Gist.Users do
  use Gist.Web, :model

  schema "users" do
    field :user_id, :string, null: false, virtual: true
    field :username, :string, null: false
    field :email, :string, null: false
    field :password, :string, virtual: true
    field :password_hash, :string, virtual: true

    has_many :gists, Gist.Gists

    timestamps()
  end

  # struct represents a record in the db that we want to save
  # params contains the properties we want to update the struct with before we save to db
  # this function returns a changeset, which represents the record we want to save in the db
  def changeset(struct, params \\ %{}) do
    struct
    # case produces a changeset which is how we want to update the db
    |> cast(params, [:title])
    |> unique_constraint([:user_id, :username, :email], name: :user_id_index)
    # inspect props of changeset and determines if it's valid, and then returns a changeset
    |> validate_required([:title])
    # what is returns is the changeset that represents what we want to update the db with
  end
end