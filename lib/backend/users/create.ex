defmodule Backend.Users.Create do
  @moduledoc"""
  Provides call method to insert user data in PostgreSQL database. 
"""
  alias Backend.User
  alias Backend.Repo
  alias Backend.Error

  def call(%{} = params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def call(_anything), do: "Data in a map format needed!"

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, changeset}) do
    {:error, Error.build(:bad_request, changeset)}
  end
end
