# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
    user = User.create!(username: Faker::Internet.user_name,
                        email: Faker::Internet.safe_email)

    rand(1..16).times do
        post = Post.create!(title: Faker::Hacker.say_something_smart,
                            body: Faker::Hipster.paragraph,
                            user_id: user.id)

        rand(2..6).times do
            Comment.create!(post_id: post.id,
                            user_id: user.id,
                            comment: Faker::Hipster.sentences.join,
                            author: Faker::Name.name)
        end
        rand(25..77).times do
            Upvote.create!(post_id: post.id)
            Upvote.create!(post_id: post.id)
        end
    end
end
