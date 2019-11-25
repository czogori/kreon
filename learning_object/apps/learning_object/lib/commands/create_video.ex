defmodule LearningObject.Commands.CreateVideo do
  alias Ecto.Changeset
  alias __MODULE__

  defstruct uuid: "",
            name: "",
            url: ""
  use ExConstructor
  use Vex.Struct

  validates(:name, presence: true, length: [min: 2])
  validates(:url, presence: true)

  def assign_uuid(%CreateVideo{} = create_video, uuid) do
    %CreateVideo{create_video | uuid: uuid}
  end
end
