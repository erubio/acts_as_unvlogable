# ----------------------------------------------
#  Class for Flotrack (flotrack.org)
#  http://www.flotrack.org/videos/play/330129
#  http://www.flotrack.org/videos/coverage/view_video/234973-usatf-road-mile-championships/176763-carrie-and-megan-post-race-usatf-mile-road-championships
# ----------------------------------------------


class VgFlotrack

  def initialize(url=nil, options={})
    @url = url
    raise unless @url.match(/play|speaker|coverage/) 
    @emb = Hpricot(open(url))
    @flashvars = CGI::unescapeHTML(@emb.to_s).split("flashvars=\"")[1].split("\"")[0]
    @args = CGI::parse(@flashvars)
  end
  
  def title
    @emb.search("h1")[0].inner_text
  end
  
  def thumbnail
    "#{@args['image']}"
  end
  
  def embed_url
    "http://www.flotrack.org/assets/portal/add_ons/mediaplayer-4.2/player.swf"
  end

  def embed_html(width=425, height=344, options={})
    "<embed src='#{embed_url}' width='#{width}' height='#{height}' bgcolor='#' allowscriptaccess='always' allowfullscreen='true' flashvars='#{@flashvars}' />"
  end
  
  def flv
    "#{@args['file']}"
  end

  def service
    "Flotrack"
  end
  
end