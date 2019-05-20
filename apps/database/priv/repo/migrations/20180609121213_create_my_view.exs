defmodule Kreon.LearningObject.Repo.Migrations.CreateMyView do
  use Ecto.Migration

  def up do
    execute """
    CREATE OR REPLACE VIEW public.my_view AS
    SELECT lo.id,
      lo.name,
      lo.description,
      reg.user_id,
      r.status,
      r.score,
      r."time",
      r.progress
    FROM registration reg
    LEFT JOIN learning_object lo ON reg.learning_object_id = lo.id
    LEFT JOIN result r ON reg.user_id = r.user_id AND reg.learning_object_id = r.learning_object_id;
    """
  end

  def down do
    execute "DROP VIEW my_view;"
  end
end
