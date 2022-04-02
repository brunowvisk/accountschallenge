defmodule Backend.Users.Update do
  @moduledoc"""
  Provides User update method. 
"""
  alias Ecto.UUID
  alias Backend.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_invalid_id_format()}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user_schema -> do_update(user_schema, params)
    end
  end

  defp do_update(%User{} = user, %{} = params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
