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

#add a post with a unique title and  boby - for indempotence assignment
puts "#{Post.count} before unique post created"
Post.find_or_create_by!(title: "A unique title", body: "A unique body")
puts "#{Post.count} after unique post created"
puts " "
puts "#{Comment.count} before unique comment created"
Comment.find_or_create_by!(post: posts.sample, body: "A unique body")
puts "#{Comment.count} after unique comment created"
