defmodule BackendWeb.AddressController do
  @moduledoc"""
  Provides address show methods. 
"""
  use BackendWeb, :controller

  action_fallback BackendWeb.FallbackController

  require Logger

  def show(conn, %{"postal_code" => postal_code}) do
    with {:ok, "postal_code"} <- Backend.get_address_by_postal_code(postal_code) do
      Logger.info("Address found!")

      conn
      |> put_status(:ok)
      |> handle_response(conn)
    end
  end

  defp handle_response({:ok, address}, conn) do
    conn
    |> put_status(:ok)
    |> json(address)
  end

  defp handle_response({:error, _reason} = error, _conn), do: error
end
