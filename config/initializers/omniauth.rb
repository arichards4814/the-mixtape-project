require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, "45935d113e3d4f9a9e8c59ac455ccd0e", "57d0101195234b9e84b4e9946d5af3ba", scope: 'playlist-modify-public'
end