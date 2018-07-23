defmodule TimelineWeb.ProjectView do
  use TimelineWeb, :view
  use JaSerializer.PhoenixView
  alias TimelineWeb.ClientView

  attributes [:name, :client_id]

  has_one :client,
    include: true,
    serializer: ClientView
end
