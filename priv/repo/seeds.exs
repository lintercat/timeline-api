# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timeline.Repo.insert!(%Timeline.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Timeline.{Work, Repo}
alias Timeline.Work.Project
alias Ecto.Query

projects = [
  %{ name: "codeams.me" },
  %{ name: "rejonpardenilla.com" }
]

projects
|> Enum.each(fn(p) -> Work.create_project(p) end)

first_project = Project
                |> Query.first()
                |> Repo.one()

tasks = [
  %{ project_id: first_project.id }
]

tasks
|> Enum.each(fn(t) -> Work.create_task(t) end)
