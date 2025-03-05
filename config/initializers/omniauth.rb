# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer if Rails.env.development?
#   # provider :diskkcord, Rails.application.credentials.discord[:client_id], Rails.application.credentials.discord[:client_secret], scope: 'identify'
# end