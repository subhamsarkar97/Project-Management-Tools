# Load the Rails application.
require_relative 'application'

ENV['CLIENT_ID'] = 'f066b51a-0aa5-4ce7-92e6-b2b970ce1a23'
ENV['CLIENT_SECRET'] = 'V6yRO._d5W.opn_Q280oE2d3~i.6WlF0eI'
ENV['OAUTH_SCOPE'] = ' http://localhost:3000/auth/microsoft_v2_auth/callback '
  'openid ' \
  'username' \
  'profile ' \
  'https://graph.microsoft.com/User.Read ' \
  'https://graph.microsoft.com/Mail.Send'


# Initialize the Rails application.
Rails.application.initialize!
