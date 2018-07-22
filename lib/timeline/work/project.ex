defmodule Timeline.Work.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Timeline.Work.{Client, Project}


  schema "projects" do
    field :name, :string
    belongs_to :client, Client

    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:name, :client_id])
    |> validate_required([:name])
  end
end
