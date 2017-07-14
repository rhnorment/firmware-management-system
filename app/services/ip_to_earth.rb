module IPToEarth

  def self.get_location_data(ip_address)
    ip_address = ip_address
    uri = URI('https://iptoearth.expeditedaddons.com')
    parameters = {
        api_key: ENV['IPTOEARTH_API_KEY'],
        ip: ip_address,
        fix_typos: true
    }

    uri.query = URI.encode_www_form(parameters)
    JSON.parse(Net::HTTP.get_response(uri).body)
  end

end