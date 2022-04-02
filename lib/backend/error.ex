defmodule Backend.Error do
  @moduledoc"""
  Provides error treatment for user and postal code.
"""
  alias Ecto.Changeset

  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  @spec build(atom(), String.t() | Changeset.t()) ::
          Struct.t(
            result: String.t() | Changeset.t(),
            status: atom()
          )

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  @spec build_user_not_found ::
          Struct.t(
            result: String.t(),
            status: :not_found
          )
  def build_user_not_found, do: build(:not_found, "User not found!")
  def build_cep_not_found_error, do: build(:not_found, "CEP not found!")
  def build_invalid_id_format, do: build(:bad_request, "Invalid id format!")
end
