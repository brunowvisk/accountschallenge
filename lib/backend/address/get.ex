defmodule Backend.Address.Get do
  @moduledoc"""
  Provides method to get postal code from ViaCep API using get_cep_info method and all users with their addresses.
"""
  alias Backend.Address
  alias Backend.ViaCep.Client

  def call(postal_code) do
    postal_code
    |> Client.get_cep_info()
    |> handle_response()
  end

  defp handle_response({:ok, body}), do: {:ok, Address.build(body)}

  defp handle_response({:error, _reason} = error), do: error

  def all_useraddress do
    Repo.all(Address)
  end

end
