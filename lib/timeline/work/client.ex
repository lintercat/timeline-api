defmodule Timeline.Work.Client do
  use Ecto.Schema
  import Ecto.Changeset
  alias Timeline.Work.Client


  schema "clients" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Client{} = client, attrs) do
    client
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
