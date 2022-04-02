defmodule BackendWeb.FallbackController do
  @moduledoc"""
  Returns error status and message when it is needed. 
"""
  use BackendWeb, :controller

  alias Backend.Error
  alias BackendWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: changeset_or_message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: changeset_or_message)
  end
end
