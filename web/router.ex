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
  end

  scope "/", Gist do
    pipe_through :browser # Use the default browser stack

    # get "/", GistController, :index
    # get "/gists/new", GistController, :new
    # post "/gists", GistController, :create
    # get "/gists/:id/edit", GistController, :edit
    # put "/gists/:id", GistController, :update

    resources "/", TopicController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Gist do
  #   pipe_through :api
  # end
end
