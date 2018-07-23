defmodule TimelineWeb.TaskView do
  use TimelineWeb, :view
  use JaSerializer.PhoenixView
  alias TimelineWeb.ProjectView

  attributes [:start_at, :end_at]

  has_one :project,
    include: true,
    serializer: ProjectView
end
