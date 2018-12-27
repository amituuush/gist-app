defmodule Gist.UsersController do
  use Gist.Web, :controller
  alias Gist.Users

  def index(conn, _params) do
    # get all users
    users = Repo.all(Users)
    # render JSON object containing all users
    render conn, "index.json", users: users
  end

  def create(conn, %{"users" => users_params}) do
    # create changeset
    changeset = Users.changeset(%Users{}, users_params)
    # use changeset to insert a new row using params
    case Repo.insert(changeset) do
      {:ok, _blogs} ->
        users = Repo.all(Users)
        render conn, "index.json", users: users
    end
  end
end