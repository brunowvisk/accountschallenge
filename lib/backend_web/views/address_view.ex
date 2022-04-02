defmodule BackendWeb.AddressView do
  @moduledoc"""
  Provides message and data when create and show methods are used.
"""
  use BackendWeb, :view

  alias Backend.Users.Address

  def render("create.json", %{address: %Address{} = address}) do
    %{
      message: "Address has been set!",
      address: address
    }
  end

  def render("show.json", %{address: %Address{} = address}), do: %{address: address}
end
