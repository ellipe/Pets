defmodule Helpers.RenderRelationship do
  @moduledoc """
  Relationship view helper, render a relationship only when is being loaded.
  """
  import Phoenix.View, only: [render_one: 4, render_many: 4]

  def render_relationship(relations, view, template, assigns \\ %{})

  def render_relationship(%Ecto.Association.NotLoaded{}, _, _, _), do: nil

  def render_relationship(relations, view, template, assigns) when is_list(relations) do
    render_many(relations, view, template, assigns)
  end

  def render_relationship(relation, view, template, assigns) do
    render_one(relation, view, template, assigns)
  end
end
