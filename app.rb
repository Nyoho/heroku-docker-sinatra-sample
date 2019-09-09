require "sinatra"

def request_header_info
  s = ''
  headers = request.env.select { |k, v| k.start_with?('HTTP_') }
  headers.each do |k, v|
    s += "<dt>#{k}</dt><dd>#{v}</dd>\n"
  end
  "<dl>#{s}</dl>"
end

get "/" do
  "Top page." + request_header_info
end

get "/redirect" do
  redirect to("foo")
end

get "/foo" do
  "Page foo." + request_header_info
end

