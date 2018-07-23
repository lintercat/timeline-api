defmodule Timeline.Repo.Migrations.DropClientsTable do
  use Ecto.Migration

  def change do
    drop_if_exists index("projects", [:client_id])
    alter table("projects") do
      remove :client_id
    end

    drop_if_exists table("clients")
  end
end
