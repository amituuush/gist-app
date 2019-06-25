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
    changeset = Users.changeset(%Users{}, users_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        new_conn = Guardian.Plug.api_sign_in(conn, user, :access)
        jwt = Guardian.Plug.current_token(new_conn)

        new_conn
        |> put_status(:created)
        |> render(Gist.SessionsView, "show.json", user: user, jwt: jwt)

      {:error, thing} ->
        Log.error("broken")
        IO.inspect thing, label: "thing"
        IO.inspect thing2, label: "thing2"
    end
  end
end