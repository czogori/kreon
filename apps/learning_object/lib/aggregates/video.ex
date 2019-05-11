defmodule LearningObject.Aggregates.Video do
  defstruct uuid: nil,
            name: nil,
            url: nil

  alias __MODULE__
  alias LearningObject.Commands.CreateVideo
  alias LearningObject.Events.VideoCreated

  def create_video(
        %Video{} = _video,
        %CreateVideo{
          uuid: uuid,
          name: name,
          url: url
        }
      ) do
    %VideoCreated{
      uuid: uuid,
      name: name,
      url: url
    }
  end

  # state mutators

  def apply(
        %Video{} = video,
        %VideoCreated{
          uuid: uuid,
          name: name,
          url: url
        }
      ) do
    %Video{video | uuid: uuid, name: name, url: url}
  end
end
