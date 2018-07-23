defmodule Timeline.Repo.Migrations.RemoveNameFromTasksTable do
  use Ecto.Migration

  def change do
    alter table("tasks") do
      remove :name
    end
  end
end
