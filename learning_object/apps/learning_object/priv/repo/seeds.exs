
if Mix.env == :dev do
  alias LearningObject

  videos = [
    %{
      name: "The Power of Composition - Scott Wlaschin",
      url: "https://www.youtube.com/watch?v=WhEkBCWpDas"
    }
  ]

  courses = [
    %{
      name: "Lonestar ElixirConf 2018",
      items: [
        %{
          name: "Day 1 Keynote - Chris McCord",
          url: "https://www.youtube.com/watch?v=qhXjq3XU9_I"
        },
        %{
          name: "Elixir is for Startups - Angle Jose",
          url: "https://www.youtube.com/watch?v=FWPcslL-tNs"
        },
        %{
          name: "Keynote - Tim Mechlem",
          url: "https://www.youtube.com/watch?v=y8373byme_Q"
        },
        %{
          name: "Managing state in distributed Elixir - Jerel Unruh",
          url: "https://www.youtube.com/watch?v=V3iBgStaPmA"
        },
        %{
          name: "Consistent, Distributed Elixir - Chris Keathley",
          url: "https://www.youtube.com/watch?v=7vHw5UfNmJA"
        },
        %{
          name: "Let's Talk Process Dictionary - Greg Vaughn",
          url: "https://www.youtube.com/watch?v=zDIoFWwfBO0"
        }
      ]
    }
  ]

  for course <- courses, do: LearningObject.create_course(course)
  for video <- videos, do: LearningObject.create_video(video)
end
