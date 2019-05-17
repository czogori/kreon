defmodule LearningObject.Router do
  use Commanded.Commands.Router

  alias LearningObject.Aggregates.{Course, Video}
  alias LearningObject.CommandHandlers.{CreateCourseHandler, CreateVideoHandler}
  alias LearningObject.Commands.{CreateCourse, CreateVideo}

  dispatch([CreateVideo], to: CreateVideoHandler, aggregate: Video, identity: :uuid)
  dispatch([CreateCourse], to: CreateCourseHandler, aggregate: Course, identity: :uuid)
end
