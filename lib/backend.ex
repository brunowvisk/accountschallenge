defmodule Backend do
  @moduledoc """
  Backend keeps the contexts that define your domain
  and business logic.
  
  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Backend.Users.Create, as: UserCreate
  alias Backend.Users.Get, as: UserGet
  alias Backend.Users.Delete, as: UserDelete
  alias Backend.Users.Update, as: UserUpdate

  alias Backend.Address.Create, as: UserAddressCreate
  alias Backend.Address.Get, as: AddressGet

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call

  defdelegate create_user_address(params), to: UserAddressCreate, as: :call

  defdelegate create_address(params), to: AddressCreate, as: :call
  defdelegate get_address_by_postal_code(params), to: AddressGet, as: :call
end
