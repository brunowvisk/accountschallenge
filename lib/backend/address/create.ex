defmodule Backend.Address.Create do
  @moduledoc"""
    Provides method to create user's address
  """

  alias Backend.Address
  alias Backend.Users.Address, as: UserAddress
  alias Backend.ViaCep.Client

  def call(%{"postal_code" => postal_code} = params) do
    postal_code
    |> Client.get_cep_info()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    params
    |> create_user_address()
  end

  defp handle_response({:error, _msg} = error, _params), do: error

  defp create_user_address(
         %{
           "city" => city,
           "complement" => complement,
           "neighborhood" => neighborhood,
           "postal_code" => postal_code,
           "state" => state,
           "street" => street,
           "number" => number,
           "user_id" => user_id
         } = address
       ) do
    params = %{
      street: street,
      neighborhood: neighborhood,
      city: city,
      state: state,
      postal_code: postal_code,
      complement: complement,
      number: number,
      user_id: user_id
    } 

    UserAddress.build(params)
  end

end
