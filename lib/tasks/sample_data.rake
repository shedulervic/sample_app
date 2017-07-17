namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "sheduler",
                 email: "sheduler.vic@gmail.com",
                 password: "4448332",
                 password_confirmation: "4448332", admin: true)
	
	users = User.all
	50.times do
	  content = Faker::Lorem.sentence(5)
	  users.each { |user| user.microposts.create!(content: content) }
	end  
  end
end