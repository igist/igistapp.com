$:.unshift File.dirname(__FILE__)

require 'nanoc'
require 'nanoc/helpers/google_analytics'
require 'nanoc/helpers/og_tags'
require 'nanoc/helpers/simple_format'
require 'nanoc/helpers/youtube'
require 'nanoc/helpers/facebook'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::GoogleAnalytics
include Nanoc::Helpers::Youtube
include Nanoc::Helpers::SimpleFormat
include Nanoc::Helpers::Text
include Nanoc::Helpers::HTMLEscape
include Nanoc::Helpers::OGTags
include Nanoc::Helpers::Facebook
