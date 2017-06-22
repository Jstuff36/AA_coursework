# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

artist1= User.create(username:'ben')
artist2 = User.create(username:"ken")
user3 = User.create(username:"Jen")
user4 = User.create(username:"wen")
user5 = User.create(username:"may")


artwork1 = Artwork.create(title: 'a01', artist_id: artist1.id, image_url: 'a1')
artwork2 = Artwork.create(title: 'a02', artist_id: artist1.id, image_url: 'a2')
artwork3 = Artwork.create(title: 'a03', artist_id: artist2.id, image_url: 'a3')
artwork4 = Artwork.create(title: 'a04', artist_id: artist2.id, image_url: 'a4')
artwork5 = Artwork.create(title: 'a05', artist_id: artist2.id, image_url: 'a5')

artworkshare1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user3.id)
artworkshare2 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user4.id)
artworkshare3 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user5.id)
artworkshare4 = ArtworkShare.create(artwork_id: artwork4.id, viewer_id: artist1.id)
artworkshare5 = ArtworkShare.create(artwork_id: artwork5.id, viewer_id: user3.id)
