defmodule Gist.Users do
  use Gist.Web, :model

  @primary_key {:user_id, :binary_id, autogenerate: true}

  schema "users" do
    field :username, :string, null: false
    field :email, :string, null: false
    field :password, :string, virtual: true
    field :password_hash, :string, virtual: true

    has_many :gists, Gist.Gists

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
    |> validate_length(:password, min: 6, max: 20)
    # TODO: get hashing working
    # |> hash_pwd_salt
  end

  # struct represents a record in the db that we want to save
  # params contains the properties we want to update the struct with before we save to db
  # this function returns a changeset, which represents the record we want to save in the db
  # def changeset(struct, params \\ %{}) do
  #   struct
  #   # case produces a changeset which is how we want to update the db
  #   |> cast(params, [:title])
  #   |> unique_constraint([:user_id, :email, :username])
  #   # inspect props of changeset and determines if it's valid, and then returns a changeset
  #   |> validate_required([:title])
  #   # what is returns is the changeset that represents what we want to update the db with
  # end
end