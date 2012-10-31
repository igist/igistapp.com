module Nanoc::Helpers

  module Facebook
    
    def fb_root( locale = 'en_US' )
      <<-HTML
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/#{locale}/all.js#xfbml=1&appId=482135611804259";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
      HTML
    end

    def fb_likebutton(href, width = 450, send = false, layout = "standard", action = "like", show_faces = false, color_scheme = "light", font = "lucida grande")
      %Q{<div class="fb-like" data-href="#{href}" data-layout="#{layout}" data-send="#{send}" data-width="#{width}" data-show-faces="#{show_faces}" data-action="#{action}" data-font="#{font}" data-colorscheme=#{color_scheme}></div>}
    end

  end
end
    
