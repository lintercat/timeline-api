defmodule TimelineWeb.ProjectView do
  use TimelineWeb, :view
  use JaSerializer.PhoenixView
  alias Timeline.Work

  attributes [:name, :client_id]

  has_one :client,
    include: true,
    serializer: TimelineWeb.ClientView
end
