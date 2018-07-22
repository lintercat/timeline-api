defmodule TimelineWeb.ClientView do
  use TimelineWeb, :view
  use JaSerializer.PhoenixView

  attributes [:name]
end
