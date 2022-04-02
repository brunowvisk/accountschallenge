defmodule Backend.Repo.Migrations.AddressTable do
  @moduledoc"""
  Provides address table for PostgreSQL database.
"""
  use Ecto.Migration

  def change do
    create table(:address, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :street, :string
      add :number, :integer
      add :complement, :string
      add :neighborhood, :string
      add :city, :string
      add :state, :string
      add :postal_code, :string
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false
    end
  end
end
