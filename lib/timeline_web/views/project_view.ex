defmodule TimelineWeb.ProjectView do
  use TimelineWeb, :view
  use JaSerializer.PhoenixView

  attributes [:name, :client_id]

  has_one :client,
    link: "/api/clients/:client_id",
    field: :client_id,
    include: true,
    serializer: TimelineWeb.ClientView

  def client(project, _conn) do
    project.client
  end
end
