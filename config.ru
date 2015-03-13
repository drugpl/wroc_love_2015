use Rack::Static,
  urls: %w( /images /js /css /fonts ),
  root: "public"

map '/venue' do
  run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/venue.html', File::RDONLY)
    ]
  }
end

map '/info' do
  run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/info.html', File::RDONLY)
    ]
  }
end

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
