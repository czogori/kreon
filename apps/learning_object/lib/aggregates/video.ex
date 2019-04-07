defmodule LearningObject.Aggregates.Video do
  defstruct uuid: nil,
            name: nil,
            url: nil

  alias __MODULE__
  alias LearningObject.Commands.CreateVideo
  alias LearningObject.Events.VideoCreated

  def execute(
        %Video{uuid: nil},
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

  # def execute(
  #       %Account{uuid: nil},
  #       %OpenAccount{
  #         initial_balance: initial_balance
  #       }
  #     )
  #     when initial_balance <= 0 do
  #   {:error, :initial_balance_must_be_above_zero}
  # end

  def execute(%Video{}, %CreateVideo{}) do
    {:error, :video_already_created}
  end

  # state mutators

  def apply(
        %Video{} = video,
        %VideoCreated{
          uuid: uuid,
          name: name,
          url:  url
        }
      ) do
    %Video{video | uuid: uuid, name: name, url: url}
  end
end