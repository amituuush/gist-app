defmodule Gist.Gist do
  use Gist.Web, :model

  # @timestamps_opts [type: :utc_datetime, usec: true]
  # @primary_key {:uuid, :binary_id, [autogenerate: true]}

  schema "gist" do
    field :title, :string
    field :description, :string

    # belongs_to :user, Gist.Gist
    # has_many :file, Gist.File

    timestamps()
  end

  # struct represents a record in the db that we want to save
  # params contains the properties we want to update the struct with before we save to db
  # this function returns a changeset, which represents the record we want to save in the db
  def changeset(struct, params \\ %{}) do
    struct
    # case produces a changeset which is how we want to update the db
    |> cast(params, [:title, :description, :created_at, :uuid])
    # inspect props of changeset and determines if it's valid, and then returns a changeset
    |> validate_required([:title, :description, :created_at])
    # what is returned is the changeset that represents what we want to update the db with
    # |> assoc_constraint(:user)
  end
end