defmodule Backend.Users.Delete do
  @moduledoc"""
  Provides User delete method.
"""
  alias Ecto.{Changeset, UUID}
  alias Backend.{Error, Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid Format!"}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user_schema -> Repo.delete(user_schema)
    end
  end
end
