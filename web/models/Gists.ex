defmodule Gist.Gists do
  use Gist.Web, :model

  @primary_key {:gist_id, :binary_id, autogenerate: true}

  schema "gists" do
    field :title, :string
    field :description, :string

    belongs_to :users, Gist.Users, foreign_key: :user_id
    # has_many :file, Gist.File

    timestamps()
  end

  # struct represents a record in the db that we want to save
  # params contains the properties we want to update the struct with before we save to db
  # this function returns a changeset, which represents the record we want to save in the db
  def changeset(struct, params \\ %{}) do
    struct
    # case produces a changeset which is how we want to update the db
    |> cast(params, [:title, :description, :created_at, :gist_id])
    |> unique_constraint([:gist_id, :user_id])
    # inspect props of changeset and determines if it's valid, and then returns a changeset
    |> validate_required([:title, :description, :created_at])
    # what is returned is the changeset that represents what we want to update the db with
    # |> assoc_constraint(:user)
  end
end