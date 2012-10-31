#
# https://devcenter.heroku.com/articles/static-sites-on-heroku
#
use Rack::Static, 
  :urls => ["/stylesheets", "/images", "/javascripts", '/ja'],
  :root => "public"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('public/index.html', File::RDONLY)
  ]
}