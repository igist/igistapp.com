require 'spec_helper'
require 'nanoc'
require 'nanoc/helpers/og_tags'
include Nanoc::Helpers::OGTags

describe Nanoc::Helpers::OGTags do
  before :each do
  end

  context 'og_tag' do

    it 'key is a string' do
      og_tag('image', 'http://example.com/ogp.jpg').should eql(
        '<meta property="og:image" content="http://example.com/ogp.jpg" />')
    end

    it 'key is an array' do
      og_tag(['image', 'secure_url'], 'https://example.com/ogp.jpg').should eql(
        '<meta property="og:image:secure_url" content="https://example.com/ogp.jpg" />')
    end

    it 'value is an hash' do
      og_tag('image', {
        :'' => 'http://example.com/ogp.jpg',
        :secure_url => 'https://example.com/ogp.jpg',
        :width => 300, :height => 400
      }).should eql((<<-HTML
<meta property="og:image" content="http://example.com/ogp.jpg" />
<meta property="og:image:secure_url" content="https://example.com/ogp.jpg" />
<meta property="og:image:width" content="300" />
<meta property="og:image:height" content="400" />
          HTML
        ).strip)
    end

    it 'first argument is an hash' do
      og_tag({ image: {
          :'' => 'http://example.com/ogp.jpg',
          :secure_url => 'https://example.com/ogp.jpg',
          :width => 300, :height => 400
      }}).should eql((<<-HTML
<meta property="og:image" content="http://example.com/ogp.jpg" />
<meta property="og:image:secure_url" content="https://example.com/ogp.jpg" />
<meta property="og:image:width" content="300" />
<meta property="og:image:height" content="400" />
          HTML
        ).strip)
    end

  end

  context 'og_tag with prefix fb' do

    it 'key is a string' do
      og_tag('image', 'http://example.com/ogp.jpg', 'fb').should eql(
        '<meta property="fb:image" content="http://example.com/ogp.jpg" />')
    end

    it 'key is an array' do
      og_tag(['image', 'secure_url'], 'https://example.com/ogp.jpg', 'fb').should eql(
        '<meta property="fb:image:secure_url" content="https://example.com/ogp.jpg" />')
    end

    it 'value is an hash' do
      og_tag('image', {
        :'' => 'http://example.com/ogp.jpg',
        :secure_url => 'https://example.com/ogp.jpg',
        :width => 300, :height => 400
      }, 'fb').should eql((<<-HTML
<meta property="fb:image" content="http://example.com/ogp.jpg" />
<meta property="fb:image:secure_url" content="https://example.com/ogp.jpg" />
<meta property="fb:image:width" content="300" />
<meta property="fb:image:height" content="400" />
          HTML
        ).strip)
    end

    it 'first argument is an hash' do
      og_tag({ image: {
          :'' => 'http://example.com/ogp.jpg',
          :secure_url => 'https://example.com/ogp.jpg',
          :width => 300, :height => 400
      }}, 'fb').should eql((<<-HTML
<meta property="fb:image" content="http://example.com/ogp.jpg" />
<meta property="fb:image:secure_url" content="https://example.com/ogp.jpg" />
<meta property="fb:image:width" content="300" />
<meta property="fb:image:height" content="400" />
          HTML
        ).strip)
    end

  end

end
