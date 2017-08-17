# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

  User.destroy_all
  u1 = User.create(id: 1, email: "user1@gmail.com")
  u2 = User.create(id: 2, email: "user2@hotmail.com")
  u3 = User.create(id: 3, email: "user3@aol.com")

  ShortenedUrl.destroy_all
  su1 = ShortenedUrl.create(id: 1, long_url: "https://www.wowthisurlissolongicanthandleie.com", short_url: "2jTKo-nm2hsElvlnrUC0Gg")
  su2 = ShortenedUrl.create(id: 2, long_url: "https://www.gollygeeanotherlongonewhowouldhavethought.com", short_url: "ake5F3WcSZI7RSg3WgZXkA")
  su3 = ShortenedUrl.create(id: 3, long_url: "https://www.manohmansomeoneshouldofferaservicetoshortentheselongurls.com", short_url: "xLjhlrDTXy2sq8MpmxklVw")
  su4 = ShortenedUrl.create(id: 4, long_url: "http://www.huhijustrealizedthissiteisntsecureihopemycreditcardsareokay.com", short_url: "Oo8AToAApqUdf3hip79cRA")

  ShortenedUser.destroy_all
  join1 = ShortenedUser.create(user_id: u1.id, shortened_url_id: su1.id)
  join2 = ShortenedUser.create(user_id: u2.id, shortened_url_id: su2.id)
  join3 = ShortenedUser.create(user_id: u3.id, shortened_url_id: su3.id)
  join4 = ShortenedUser.create(user_id: u3.id, shortened_url_id: su4.id)

end
