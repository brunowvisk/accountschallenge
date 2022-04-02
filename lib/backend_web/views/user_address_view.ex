defmodule BackendWeb.UserAddressView do
  use BackendWeb, :view

  alias Backend.Users.Address

  def render("create.json", %{
        address: %Address{
          street: street,
          neighborhood: neighborhood,
          city: city,
          state: state,
          postal_code: postal_code,
          user_id: user_id,
          complement: complement,
          number: number
        }
      }) do
    %{
      message: "Address has been set!",
      address: %{
        street: street,
        neighborhood: neighborhood,
        city: city,
        state: state,
        postal_code: postal_code,
        user_id: user_id,
        number: number,
        complement: complement
      }
    }
  end
end
