defmodule LearningObject.Router do
  use Commanded.Commands.Router

  alias LearningObject.Aggregates.{Course, Video, Registration, Session}

  alias LearningObject.CommandHandlers.{
    BeginSessionHandler,
    CreateCourseHandler,
    CreateVideoHandler,
    RegisterUserHandler
  }

  alias LearningObject.Commands.{
    CreateCourse,
    CreateVideo,
    RegisterUser,
    BeginSession
  }

  dispatch([CreateVideo], to: CreateVideoHandler, aggregate: Video, identity: :uuid)
  dispatch([CreateCourse], to: CreateCourseHandler, aggregate: Course, identity: :uuid)
  dispatch([RegisterUser], to: RegisterUserHandler, aggregate: Registration, identity: :id)
  dispatch([BeginSession], to: BeginSessionHandler, aggregate: Session, identity: :uuid)
end
