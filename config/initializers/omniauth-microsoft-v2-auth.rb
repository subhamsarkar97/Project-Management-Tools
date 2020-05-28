Rails.application.config.middleware.use OmniAuth::Builder do
    provider :microsoft_v2_auth, ENV['f066b51a-0aa5-4ce7-92e6-b2b970ce1a23'], ENV['V6yRO._d5W.opn_Q280oE2d3~i.6WlF0eI']
    callback_url: ' http://localhost:3000/auth/microsoft_v2_auth/callback '
end