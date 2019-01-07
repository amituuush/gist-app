defmodule Gist.SessionsView do
  use Gist.Web, :view

  def render("show.json", %{user: user, jwt: jwt}) do
    %{
      data: user_data_json(user),
      meta: meta_json(jwt)
    }
  end

  def user_data_json(user) do
    %{
      id: user.user_id,
      username: user.username
    }
  end

  def meta_json(jwt) do
    %{
      token: jwt
    }
  end
end