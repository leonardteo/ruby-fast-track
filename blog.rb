require "./lib/model"
require "./user"
require "./post"

post1 = Post.create({
  title: "Post 1",
  body: "Bacon ipsum dolor sit amet beef shoulder frankfurter brisket short loin. Capicola shankle pork belly, turducken chuck doner leberkas short loin. Boudin strip steak pork loin shankle flank spare ribs shoulder. Ball tip leberkas beef shank jerky beef ribs tongue capicola short loin pork belly filet mignon ribeye pork doner.",
  user_id: 1
  })

post2 = Post.create({
  title: "Post 2",
  body: "Bacon ipsum dolor sit amet beef shoulder frankfurter brisket short loin. Capicola shankle pork belly, turducken chuck doner leberkas short loin. Boudin strip steak pork loin shankle flank spare ribs shoulder. Ball tip leberkas beef shank jerky beef ribs tongue capicola short loin pork belly filet mignon ribeye pork doner.",
  user_id: 1
  })

post3 = Post.create({
  title: "Post 3",
  body: "Bacon ipsum dolor sit amet beef shoulder frankfurter brisket short loin. Capicola shankle pork belly, turducken chuck doner leberkas short loin. Boudin strip steak pork loin shankle flank spare ribs shoulder. Ball tip leberkas beef shank jerky beef ribs tongue capicola short loin pork belly filet mignon ribeye pork doner.",
  user_id: 1
  })

user = User.new({
  first_name: "Leonard",
  last_name: "Teo",
  })

user.posts = []
user.posts.push post1
user.posts.push post2
user.posts.push post3


user.posts.each do |post|
  puts post.title
  puts post.body
  puts 
end

