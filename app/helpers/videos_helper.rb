module VideosHelper
  def embedded_video(video)
    youtube_id = video.link.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", width: "100%", height: "520px")
  end
end
