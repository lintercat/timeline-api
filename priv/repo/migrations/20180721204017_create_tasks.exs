defmodule Timeline.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :start_at, :naive_datetime
      add :end_at, :naive_datetime
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:project_id])
  end
end
