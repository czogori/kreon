defmodule LearningObject do
  alias LearningObject.Commands.{
    BeginSession,
    EndSession,
    CreateCourse,
    CreateVideo,
    RegisterUser
  }

  alias LearningObject.Router

  @moduledoc """
  Bounded context for Learning Object
  """

  def create_course(params) do
    uuid = Ecto.UUID.generate()

    res =
      CreateCourse.new(params)
      |> CreateCourse.assign_uuid(uuid)
      |> Router.dispatch(consistency: :strong)

    with :ok <- res do
      {:ok, one(uuid)}
    else
      reply -> reply
    end
  end

  def create_video(params) do
    uuid = Ecto.UUID.generate()

    res =
      CreateVideo.new(params)
      |> CreateVideo.assign_uuid(uuid)
      |> Router.dispatch(consistency: :strong)

    with :ok <- res do
      {:ok, one(uuid)}
    else
      reply -> reply
    end
  end

  def register(user_id, learning_object_id) do
    res =
      %RegisterUser{user_id: user_id, learning_object_id: learning_object_id}
      |> RegisterUser.assign_uuid(Ecto.UUID.generate())
      |> Router.dispatch(consistency: :strong)

    with :ok <- res do
    end
  end

  def start_session(user_id, learning_object_id) do
    res =
      %BeginSession{user_id: user_id, learning_object_id: learning_object_id}
      |> BeginSession.assign_uuid(Ecto.UUID.generate())
      |> BeginSession.assign_begin(DateTime.utc_now())
      |> Router.dispatch(consistency: :strong)

    with :ok <- res do
    end
  end

  def end_session(user_id, learning_object_id) do
    res =
      %EndSession{user_id: user_id, learning_object_id: learning_object_id}
      |> EndSession.assign_uuid(Ecto.UUID.generate())
      |> EndSession.assign_end(DateTime.utc_now())
      |> Router.dispatch(consistency: :strong)

    with :ok <- res do
    end
  end

  defdelegate all(), to: LearningObject.Queries.LearningObject
  defdelegate one(id), to: LearningObject.Queries.LearningObject
  defdelegate my(user_id), to: LearningObject.Queries.Registration
end
