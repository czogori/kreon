defmodule Kreon.LearningObject.Repo.Migrations.CreateMyView do
  use Ecto.Migration

  def up do
    execute """
    CREATE OR REPLACE VIEW public.my_view AS 
 SELECT lo.id,
    lo.name,
    lo.description,
    lou.user_id,
    r.status,
    r.score,
    r."time",
    r.progress
   FROM learning_object_user lou
     LEFT JOIN learning_object lo ON lou.learning_object_id = lo.id
     LEFT JOIN result r ON lou.user_id = r.user_id AND lou.learning_object_id = r.learning_object_id;
    """
  end

  def down do
    execute "DROP VIEW my_view;"
  end
end
