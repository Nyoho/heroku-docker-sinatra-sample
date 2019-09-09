require "sinatra"

def head
  "<head><style>body{font-family: -apple-system, sans-serif;}</style></head>"
end

def request_header_info
  s = ''
  headers = request.env #.select { |k, v| k.start_with?('HTTP_') }
  headers.each do |k, v|
    s += "<dt>#{k}</dt><dd>#{v}</dd>\n"
  end
  "<h2>Request headers</h2><dl>#{s}</dl>"
end

def env_info
  s = ''
  ENV.each do |k, v|
    s += "<dt>#{k}</dt><dd>#{v}</dd>\n"
  end
  "<h2>Env</h2><dl>#{s}</dl>"
end

get "/" do
  head + "<body><h1>Top</h1>" + request_header_info + env_info
end

get "/redirect" do
  redirect to("foo")
end

get "/foo" do
  head + "<body><h1>foo</h1>" + request_header_info + env_info
end

