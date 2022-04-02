defmodule Backend.Users.Get do
  alias Ecto.UUID
  alias Backend.{Repo, User, Error}
  @moduledoc"""
  Provides User show method by id. 
"""

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_invalid_id_format()}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user_schema -> {:ok, user_schema}
    end
  end
end
