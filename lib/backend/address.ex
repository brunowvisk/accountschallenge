defmodule Backend.Address do
  @moduledoc"""
    Provides the schema and required fields
  """

  use Ecto.Schema

  @keys [:street, :neighborhood, :city, :state, :postal_code, :complement]

  @enforce_keys @keys
  @derive Jason.Encoder
  defstruct @keys

  def build(%{
        "logradouro" => street,
        "bairro" => neighborhood,
        "localidade" => city,
        "uf" => state,
        "cep" => postal_code,
        "complemento" => complement
      }) do
    %__MODULE__{
      street: street,
      neighborhood: neighborhood,
      city: city,
      state: state,
      postal_code: postal_code,
      complement: complement
    }
  end
end
