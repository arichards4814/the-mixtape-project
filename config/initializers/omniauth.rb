require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
        spotify_key = ENV['spotify_api_key']
        spotify_secret = ENV['spotify_api_secret']
        provider :spotify, spotify_key, spotify_secret, scope: 'playlist-modify-public'
end