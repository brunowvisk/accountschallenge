defmodule Backend.User do
  @moduledoc"""
    Provides the schema and required fields
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.Users.Address

  @fields_that_can_be_changed [
    :name,
    :cpf
  ]

  @required_fields [
    :name,
    :cpf
  ]

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :name, :cpf]}

  schema "users" do
    field :name, :string
    field :cpf, :string

    has_one(:address, Address)
  end

  def build(changeset), do: apply_action(changeset, :insert)

  def changeset(struct \\ %__MODULE__{}, %{} = params) do
    struct
    |> cast(params, @fields_that_can_be_changed)
    |> validate_required(@required_fields)
    |> validate_length(:cpf, is: 11)
    |> unique_constraint([:cpf])
  end
end
