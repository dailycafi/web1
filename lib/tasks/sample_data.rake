namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_productinfos
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@gmail.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  5.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_productinfos
  users = User.all(limit: 6)
  5.times do
    product_name  = Faker::Name.name
    content = Faker::Lorem.sentence(5)
    img_url = Faker::Lorem.sentence(5)
    category = Faker::Name.name
    users.each { |user| user.productinfos.create!(category:     category,
                                                  content:      content,
                                                  img_url:      img_url,
                                                  product_name: product_name) }
  end
end


def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end