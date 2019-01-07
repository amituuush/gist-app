defmodule Gist.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Gist.Repo
  alias Gist.Users

  def for_token(users = %Users{}), do: {:ok, "Users:#{users.user_id}"}
  def for_token(_), do: {:error, "Unknown resource type"}
  def from_token("Users:" <> id), do: {:ok, Repo.get(Users, String.to_integer(id))}
  def from_token(_), do: {:error, "Unknown resource type"}
end