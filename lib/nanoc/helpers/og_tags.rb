module Nanoc::Helpers

  module OGTags

    def og_tag(key, obj = nil, prefix = 'og')
      case key
      when String
        key = [key]
      when Hash
        prefix = obj if obj
        obj = key
        key = []
      end
      if obj.is_a? Hash
        obj.map{|k, v|
          og_tag(k.to_s.empty? ? key.dup : (key.dup << k) , v, prefix)
        }.join("\n")
      else
        key
        "<meta property=\"#{prefix}:#{key.join(':')}\" content=\"#{obj}\" />"
      end
    end

  end
end
