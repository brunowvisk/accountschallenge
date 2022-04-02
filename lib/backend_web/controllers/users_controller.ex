defmodule BackendWeb.UsersController do
  @moduledoc"""
  Provides User CRUD methods (create, show, update and delete). 
"""

  use BackendWeb, :controller

  alias Backend.User
  alias BackendWeb.FallbackController

  action_fallback FallbackController

  require Logger

  def create(conn, params) do
    with {:ok, %User{} = user} <- Backend.create_user(params) do
      Logger.info("User created!")

      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Backend.get_user_by_id(id) do
      Logger.info("User found!")

      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def update(conn, %{} = params) do
    with {:ok, %User{} = user} <- Backend.update_user(params) do
      Logger.info("User updated!")
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Backend.delete_user(id) do
      Logger.info("User deleted!")

      conn
      |> put_status(:ok)
      |> text("User deleted!")
    end
  end
end
