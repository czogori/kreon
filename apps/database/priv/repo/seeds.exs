alias Kreon.LearningObject
alias Kreon.User.Command.Register

aj_id = "fec66567-5cc9-4fd5-a597-d65f6b888a50"
test_id = "ee3e7a81-6a76-4e6c-968d-165296144afc"
admin_id = "b9a44df3-ec6b-4363-adf1-46dae1a4edd5"

users = [
  %{id: aj_id, login: "aj", password: "qwerty", email: "arek.jaskolski@gmail.com", name: "Arek", surname: "Jaskólski", role: "user"},
  %{id: test_id, login: "test", password: "qwerty", email: "test@test.pl", name: "Jan", surname: "Kowalski", role: "user"},
  %{id: admin_id, login: "admin", password: "qwerty", email: "admin@admin.com", name: "Administrator", surname: "GLobalny", role: "admin"}
]

for user <- users, do: Register.execute(user)

id = Ecto.UUID.generate
los = [
  %{
    id: id,
    name: "Lonestar ElixirConf 2018",
    type: "video",
    url: "https://www.youtube.com/watch?v=qhXjq3XU9_I",
    description: "Lonestar ElixirConf 2018"
  },
  %{
    id: Ecto.UUID.generate,
    parent_id: id,
    name: "Keynote - Chris McCord",
    type: "video",
    url: "https://www.youtube.com/watch?v=qhXjq3XU9_I",
    description: "Keynote - Chris McCord"
  },
  %{
    id: Ecto.UUID.generate,
    parent_id: id,
    name: "Why Elixir Matters A Genealogy of Functional Programming",
    type: "video",
    url: "https://www.youtube.com/watch?v=X2u0bBqhRKE",
    description: "Lonestar ElixirConf 2018 - Day 1 Keynote - Chris McCord"
  },
  
]

for lo <- los, do: LearningObject.create(lo)
