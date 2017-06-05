defmodule PhoenixLdapExample.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixLdapExample.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :name, :email])
    |> validate_required([:username, :name, :email])
  end
end
