defmodule Backend.Repo.Migrations.UsersTable do
  @moduledoc"""
  Provides user table for PostsgreSQL database. 
"""
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :cpf, :string
    end

    create unique_index(:users, [:cpf])
  end
end
