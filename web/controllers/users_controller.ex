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
      {:ok, _} ->
        user = Repo.get_by(Users, username: username)
        new_conn = Guardian.Plug.api_sign_in(conn, user, :access)
        jwt = Guardian.Plug.current_token(new_conn)

        new_conn
        |> put_status(:created)
        |> render(PhoenixUserAuthentication.SessionsView, "show.json", user: user, jwt: jwt)
    end
  end
end