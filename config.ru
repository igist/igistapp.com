require 'rubygems'

use Rack::Static,
  :urls => ["/stylesheets", "/images", "/javascripts"],
  :root => "public"

run lambda { |env|
  path = env["PATH_INFO"]
  p path
  if path == '/favicon.ico'
    return [
      200,
      {
        'Content-Type'  => 'image/vnd.microsoft.icon',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open("public/favicon.ico", File::RDONLY)
    ]
  end
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
