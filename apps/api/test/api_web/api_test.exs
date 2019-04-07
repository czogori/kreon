defmodule ApiWeb.ApiTest do
    use ApiWeb.ConnCase, async: true
  
    describe "Learning objects" do
      setup do
        [lo: %{id: "fd888805-e9e6-4f7f-b5d6-77ea828c1399"}]
      end
  
      test "find learning object by id", %{conn: conn, lo: %{id: id}} do
        query = """
        {
          learningObject(id: "#{id}") {
            name,
            url,
            description
          }
        }
        """

        res =
          conn
          |> get("/api", %{query: query})
          |> json_response(200)
  
        assert res == %{"data" => %{"learningObject" => 
          %{
            "description" => "Lonestar ElixirConf 2018",
            "name" => "Lonestar ElixirConf 2018", 
            "url" => "https://www.youtube.com/watch?v=qhXjq3XU9_I"
            }
          }
        }
      end

      test "find all learning objects", %{conn: conn} do
        query = """
        {
          learningObjects {
            id,
            name,
            type,
            url,
            parentId,
            description
          }
        }
        """

        res =
          conn
          |> get("/api", %{query: query})
          |> json_response(200)
  
        assert res == %{"data" => %{"learningObjects" => 
        [
          %{"description" => "Lonestar ElixirConf 2018", "id" => "fd888805-e9e6-4f7f-b5d6-77ea828c1399", "name" => "Lonestar ElixirConf 2018", "parentId" => nil, "type" => "video", "url" => "https://www.youtube.com/watch?v=qhXjq3XU9_I"}
        ]
        }}
      end

    end
  end
