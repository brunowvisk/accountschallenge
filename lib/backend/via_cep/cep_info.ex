defmodule Backend.ViaCep.CepInfo do
  def build(city, state, neighborhood, street, postal_code),
    do: %{
      "city" => city,
      "state" => state,
      "neighborhood" => neighborhood,
      "street" => street,
      "postal_code" => postal_code
    }
end
