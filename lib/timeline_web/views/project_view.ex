defmodule TimelineWeb.ProjectView do
  use TimelineWeb, :view
  use JaSerializer.PhoenixView

  attributes [:name]
end
