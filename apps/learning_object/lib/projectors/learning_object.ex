defmodule LearningObject.Projectors.LearningObject do
  use Commanded.Projections.Ecto,
    name: "LearningObject.Projectors.LearningObject",
    consistency: :strong

  alias LearningObject.Events.{CourseCreated, VideoCreated}
  alias LearningObject.ReadModels.LearningObject, as: Lo

  project(%VideoCreated{} = video_created, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :learning_object, %Lo{
      id: video_created.uuid,
      name: video_created.name,
      url: video_created.url,
      type: "video"
    })
  end)

  project(%CourseCreated{} = course_created, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :learning_object, %Lo{
      id: course_created.uuid,
      name: course_created.name,
      type: "course"
    })
    items = for item <- course_created.items do
      %{
        id: Ecto.UUID.generate(),
        name: item["name"],
        url: item["url"],
        parent_id: course_created.uuid,
        type: "video"
      }
    end
    Ecto.Multi.insert_all(multi, :learning_object_items, Lo, items)
  end)
end
