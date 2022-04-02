defmodule BackendWeb.UserAddressController do
  @moduledoc"""
  Provides a complete account "create methods", combining address and user. 
"""
  use BackendWeb, :controller

  alias Backend.Users.Address

  action_fallback Backend.FallbackController

  require Logger

  def index(conn, _params) do
    case Get.all_useraddress() do
      address when is_list(address) ->
        conn
        |> put_status(:ok)
        |> render("index.json", address: address)
      {:error, reason} ->
        conn
        |> put_status(400)
        |> render("error.json", result: reason)
    end
  end

  def create(conn, params) do
    with {:ok, %Address{} = address} <- Backend.create_user_address(params) do
      Logger.info("Account created!")

      conn
      |> put_status(:created)
      |> render("create.json", address: address)
    end
  end

  defp handle_response({:ok, address}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, address: address)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
