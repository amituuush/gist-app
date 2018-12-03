defmodule Gist.File do
  use Gist.Web, :model

  schema "file" do
    field :name, :string
    field :language, :string
    # field :body, :string

    belongs_to :gist, Gist.Gists
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

# file_version: file_id, file_version | files that don't change will reference the same version
# version: version_id, gist_id, created_on, prior_version_id
