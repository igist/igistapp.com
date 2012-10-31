module Nanoc::Helpers

  module Youtube
    
    def youtube(id, width = 480, height = 360)
      "<iframe width=\"#{width}\" height=\"#{height}\" src=\"http://www.youtube.com/embed/#{id}\" frameborder=\"0\" allowfullscreen></iframe>"
    end
  end
end
    
