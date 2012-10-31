module Nanoc::Helpers

  module SimpleFormat
    
    def simple_format(text)
      text = '' if text.nil?
      text = text.dup
      text = text.to_str
      text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
      text.gsub!(/\n\n+/, "</p>\n\n#{start_tag}")  # 2+ newline  -> paragraph
      text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />') # 1 newline   -> br
      text.insert 0, "<p>"
      text.concat("</p>")
    end
    
    def simple_line_break(text)
      text = '' if text.nil?
      text = text.dup
      text = text.to_str
      text.gsub!(/\r\n?/, "\n")
      text.gsub!(/(\n)/, '\1<br />')
    end
    
  end
end
    
