if Mix.env == :dev do
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
end
