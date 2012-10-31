module Nanoc::Helpers

  module GoogleAnalytics
    
    def google_analytics(id, domain_name = nil, allow_linker = false)
    
      set_domain_name  = domain_name  ? "_gaq.push(['_setDomainName', '#{domain_name}']);" : nil
      set_allow_linker = allow_linker ? "_gaq.push(['_setAllowLinker', true]);" : nil
      
      <<-JS
      <script type="text/javascript">
      
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '#{id}']);
        #{set_domain_name}
        #{set_allow_linker}
        _gaq.push(['_trackPageview']);
      
        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      
      </script>
      JS
    
    end
  end
end
    
