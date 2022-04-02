defmodule Backend.Users.Address do
  @moduledoc"""
  Provides the schema combining User and address.
"""

  use Ecto.Schema
  import Ecto.Changeset

  alias Backend.User

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "address" do
    field :street, :string
    field :number, :integer
    field :complement, :string
    field :neighborhood, :string
    field :city, :string
    field :state, :string
    field :postal_code, :string
    belongs_to(:user, User)
  end

  @required [:street, :number, :complement, :neighborhood, :city, :state, :postal_code, :user_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:postal_code, is: 8)
  end
end
