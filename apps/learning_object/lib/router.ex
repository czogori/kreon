defmodule LearningObject.Router do
  use Commanded.Commands.Router

  alias LearningObject.Aggregates.{Course, Video, Registration}

  alias LearningObject.CommandHandlers.{
    CreateCourseHandler,
    CreateVideoHandler,
    RegisterUserHandler
  }

  alias LearningObject.Commands.{
    CreateCourse,
    CreateVideo,
    RegisterUser
  }

  dispatch([CreateVideo], to: CreateVideoHandler, aggregate: Video, identity: :uuid)
  dispatch([CreateCourse], to: CreateCourseHandler, aggregate: Course, identity: :uuid)
  dispatch([RegisterUser], to: RegisterUserHandler, aggregate: Registration, identity: :id)
end
