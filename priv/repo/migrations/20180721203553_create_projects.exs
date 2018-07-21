defmodule Timeline.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :client_id, references(:clients, on_delete: :nothing)

      timestamps()
    end

    create index(:projects, [:client_id])
  end
end
