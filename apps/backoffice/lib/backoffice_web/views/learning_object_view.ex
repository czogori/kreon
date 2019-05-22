defmodule BackofficeWeb.LearningObjectView do
  use BackofficeWeb, :view

  def embeded_yt(url) do
    String.replace(url, "/watch?v=", "/embed/")
  end

  def type("video") do
    """
    <img src="https://socialmedia.biz.pl/wp-content/uploads/2018/07/youtube-logo.png" width="128px" />
    """
  end

  def type("course") do
  end
end
