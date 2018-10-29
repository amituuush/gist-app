defmodule Gist.GistController do
  use Gist.Web, :controller

  alias Gist.Gist
  # conn contains all info from the request (headers, body, cookies ,etc) and is what we respond with to the client

  def index(conn, _params) do
    gists = Repo.all(Gist)

    render conn, "index.html", gists: gists
  end

  def new(conn, _params) do
    changeset = Gist.changeset(%Gist{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"gist" => gist}) do
    changeset = Gist.changeset(%Gist{}, gist)

    case Repo.insert(changeset) do
      {:ok, _gist} ->
        conn
        |> put_flash(:info, "Gist Created")
        |> redirect(to: gist_path(conn, :index))

      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => gist_id}) do
    gist = Repo.get(Gist, gist_id)
    changeset = Gist.changeset(gist)

    render conn, "edit.html", changeset: changeset, gist: gist
  end

  def update(conn, %{"id" => gist_id, "gist" => gist}) do
    old_gist = Repo.get(gist_id)
    changeset = Gist.changeset(old_gist, gist)

      # changeset contains the id of the gist and the updated gist title
      case Repo.update(changeset) do
        {:ok, _gist} ->
          conn
          |> put_flash(:info, "Gist Updated")
          |> redirect(to: gist_path(conn, :index))

        {:error, changeset} ->
          render conn, "edit.html", changeset: changeset, gist: old_gist
      end
  end

  def delete(conn, %{"id" => gist_id}) do
    Repo.get!(Gist, gist_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Gist Deleted")
    |> redirect(to: gist_path(conn, :index))
  end
end