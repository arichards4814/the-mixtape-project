require 'rspotify'

RSpotify.authenticate("45935d113e3d4f9a9e8c59ac455ccd0e","57d0101195234b9e84b4e9946d5af3ba")

artists = RSpotify::Artist.search('Arctic Monkeys')

test = artists.first

p test.albums.first.tracks.first.href