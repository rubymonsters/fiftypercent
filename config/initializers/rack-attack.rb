Rack::Attack.throttle('events/create', :limit => 1, :period => 180.seconds) do |req|
  req.ip if req.path == '/events' && req.post?
end

# Throttle login attempts for a given email parameter to 6 reqs/minute
# Return the email as a discriminator on POST /login requests
Rack::Attack.throttle('logins/', :limit => 3, :period => 60.seconds) do |req|
  req.params['email'] if ['/log_in', '/sessions'].include?(req.path) && req.post?
end