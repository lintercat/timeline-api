defmodule TimelineWeb.ProjectController do
  use TimelineWeb, :controller

  alias Timeline.Work
  alias Timeline.Work.Project

  action_fallback TimelineWeb.FallbackController

  def index(conn, _params) do
    projects = Work.list_projects()
    render(conn, "index.json", projects: projects)
  end

  def create(conn, %{"project" => project_params}) do
    with {:ok, %Project{} = project} <- Work.create_project(project_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", project_path(conn, :show, project))
      |> render("show.json", project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Work.get_project!(id)
    render(conn, "show.json", project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Work.get_project!(id)

    with {:ok, %Project{} = project} <- Work.update_project(project, project_params) do
      render(conn, "show.json", project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Work.get_project!(id)
    with {:ok, %Project{}} <- Work.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end
