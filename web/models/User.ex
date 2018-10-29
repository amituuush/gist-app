defmodule Gist.User do
  use Gist.Web, :model

  schema "user" do
    field :username, :string, null: false
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string, virtual: true

    has_many :gist, Gist.Gist

    timestamps()
  end

  # struct represents a record in the db that we want to save
  # params contains the properties we want to update the struct with before we save to db
  # this function returns a changeset, which represents the record we want to save in the db
  def changeset(struct, params \\ %{}) do
    struct
    # case produces a changeset which is how we want to update the db
    |> cast(params, [:title])
    # inspect props of changeset and determines if it's valid, and then returns a changeset
    |> validate_required([:title])
    # what is returns is the changeset that represents what we want to update the db with
  end
end