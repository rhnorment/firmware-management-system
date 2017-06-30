def firmware_build_attributes(overrides={})
  {
      release_date: Faker::Date.forward(3),
      hardware_revision: 1.1,
      software_revision: 2.2,
      image_a: File.new("#{Rails.root}/spec/support/fixtures/profile1.bin"),
      image_b: File.new("#{Rails.root}/spec/support/fixtures/profile2.bin")
  }.merge(overrides)
end

def test_env(overrides={})
  {
      'GATEWAY_INTERFACE'=> 'CGI/1.2',
      'HTTP_ACCEPT'=> 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
      'HTTP_ACCEPT_CHARSET'=> 'ISO-8859-1,utf-8;q=0.7,*;q=0.7',
      'HTTP_ACCEPT_ENCODING'=> 'gzip,deflate',
      'HTTP_ACCEPT_LANGUAGE'=> 'en-us,en;q=0.5',
      'HTTP_CONNECTION'=> 'keep-alive',
      'HTTP_HOST'=> 'localhost:4567',
      'HTTP_KEEP_ALIVE'=> 300,
      'HTTP_USER_AGENT'=> 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.3) Gecko/20090920 Firefox/3.5.3 (Swiftfox)',
      'HTTP_VERSION'=> 'HTTP/1.1',
      'PATH_INFO'=> '/',
      'QUERY_STRING'=> '',
      'REMOTE_ADDR'=> '127.0.0.1',
      'REQUEST_METHOD'=> 'GET',
      'REQUEST_PATH'=> '/',
      'REQUEST_URI'=> '/',
      'SCRIPT_NAME'=> '',
      'SERVER_NAME'=> 'localhost',
      'SERVER_PORT'=> '4567',
      'SERVER_PROTOCOL'=> 'HTTP/1.1',
      'SERVER_SOFTWARE'=> 'Mongrel 1.1.5',
      'rack.multiprocess'=> false,
      'rack.multithread'=> true,
      'rack.request.form_hash'=> '',
      'rack.request.form_vars'=> '',
      'rack.request.query_hash'=> '',
      'rack.request.query_string'=> '',
      'rack.run_once'=> false,
      'rack.url_scheme'=> 'http',
      'rack.version'=> '1: 0'
  }.merge(overrides)
end

def api_request(overrides={})
  {
    gateway_interface: 'CGI/1.2',
    http_accept: 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
    http_accept_charset: 'ISO-8859-1,utf-8;q=0.7,*;q=0.7',
    http_accept_encoding: 'gzip,deflate',
    http_accept_language: 'en-us,en;q=0.5',
    http_cache_control: '',
    http_connection: 'keep-alive',
    http_cookie: '',
    http_host: 'localhost:4567',
    http_keep_alive: 300,
    http_referrer: '',
    http_user_agent: 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.3) Gecko/20090920 Firefox/3.5.3 (Swiftfox)',
    new: false,
    path_info: '/',
    query_string: '',
    remote_address: '127.0.0.1',
    remote_host: '',
    remote_user: '',
    request_method: 'GET',
    request_uri: '/',
    server_name: 'localhost',
    server_protocol: 'HTTP/1.1',
  }
end