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
  end)
end
