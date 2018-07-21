defmodule TimelineWeb.TaskView do
  use TimelineWeb, :view
  alias TimelineWeb.TaskView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      name: task.name,
      start_at: task.start_at,
      end_at: task.end_at}
  end
end
