def firmware_build_attributes(overrides = {})
  {
      release_date: Faker::Date.forward(3),
      hardware_revision: 1.1,
      software_revision: 2.2,
      image_a: File.new("#{Rails.root}/spec/support/fixtures/profile1.bin"),
      image_b: File.new("#{Rails.root}/spec/support/fixtures/profile2.bin")
  }.merge(overrides)
end

def api_request(overrides = {})
  {
    city: 'Chesapeake',
    country: 'United States',
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
    latitude: 36.81903839111328,
    longitude: -76.27494049072266,
    new: false,
    path_info: '/',
    query_string: '',
    region: 'Virginia',
    remote_address: '127.0.0.1',
    remote_host: '',
    remote_user: '',
    request_method: 'GET',
    request_uri: '/',
    server_name: 'localhost',
    server_protocol: 'HTTP/1.1',
  }.merge(overrides)
end

def email_recipient(overrides = {})
  {
    name: 'Test User',
    email: 'test@example.com'
  }
end