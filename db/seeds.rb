require 'random_data'

#create posts
50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragragh
    )
end

posts = Post.all

#create comments

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragragh
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
