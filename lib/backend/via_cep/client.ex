defmodule Backend.ViaCep.Client do
  @moduledoc"""
    Provides method for getting data from ViaCep API and return status and message error if an error occurs.
  """

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws"

  alias Backend.Error
  alias Backend.ViaCep.CepInfo
  alias Tesla.Env, as: Response

  plug Tesla.Middleware.JSON

  def get_cep_info(postal_code) do
    "/#{postal_code}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:error, reason}), do: {:error, Error.build(:bad_request, reason)}

  defp handle_get({:ok, %Tesla.Env{status: 400, body: _body}}),
    do: {:error, Error.build(:bad_request, "Invalid CEP!")}

  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, "Not found!"}

  defp handle_get({:ok, _reason} = error), do: error

  defp handle_get({:ok, %Response{status: 200, body: body}}) do
    %{
      "uf" => state,
      "localidade" => city,
      "bairro" => neighborhood,
      "logradouro" => street,
      "cep" => postal_code
    } =
      body

    {:ok, CepInfo.build(city, state, neighborhood, street, postal_code)}
  end
end
