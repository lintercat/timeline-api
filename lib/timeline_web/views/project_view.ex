defmodule TimelineWeb.ProjectView do
  use TimelineWeb, :view
  use JaSerializer.PhoenixView
  alias Timeline.Work

  attributes [:name, :client_id]

  has_one :client,
    include: true,
    serializer: TimelineWeb.ClientView

  def client(project, _conn) do
    Work.get_client!(project.client_id)
  end
end
