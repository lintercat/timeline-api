defmodule Timeline.Work.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Timeline.Work.{Task, Project}


  schema "tasks" do
    field :start_at, :naive_datetime
    field :end_at, :naive_datetime
    belongs_to :project, Project

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:end_at, :project_id])
  end

  def assign_starting_datetime_to_now(changeset) do
    changeset
    |> put_change(:start_at, DateTime.utc_now)
  end
end
