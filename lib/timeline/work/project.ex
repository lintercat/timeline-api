defmodule Timeline.Work.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Timeline.Work.Project


  schema "projects" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
