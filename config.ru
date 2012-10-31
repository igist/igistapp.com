#
# https://devcenter.heroku.com/articles/static-sites-on-heroku
#
use Rack::Static, 
  :urls => ["/stylesheets", "/images", "/javascripts"],
  :root => "public"

run lambda { |env|
  path = env["PATH_INFO"]
  path = "#{path}/" unless path.end_with?('/')
  begin
    content = File.open("public#{path}index.html", File::RDONLY)
    status = 200
  rescue
    content = File.open("public/404/index.html", File::RDONLY)
    status = 404
  end
  [
    status, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    content
  ]
}