defmodule Timeline.Work.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :end_at, :naive_datetime
    field :name, :string
    field :start_at, :naive_datetime
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :start_at, :end_at])
    |> validate_required([:name, :start_at, :end_at])
  end
end
