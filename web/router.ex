defmodule Gist.Router do
  use Gist.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", Gist do
    pipe_through :browser # Use the default browser stack

    get "/", GistController, :index
    # get "/gists/new", GistController, :new
    # post "/gists", GistController, :create
    # get "/gists/:id/edit", GistController, :edit
    # put "/gists/:id", GistController, :update

    # resources "/", GistController
  end

  scope "/api", Gist do
    pipe_through :api

    get "/", GistController, :index

    get "/users", UsersController, :index

    # new user sign up
    post "/users", UsersController, :create

    # user login
    post "/sessions", SessionsController, :create # login

    # user log out
    delete "/sessions", SessionsController, :delete # log out
  end
end
