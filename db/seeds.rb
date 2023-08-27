until Country.count == 20 do
    Country.create(name: Faker::Address.country) if !Country.pluck(:name).include?(Faker::Address.country)
end
  
  countries = Country.all
  
until Article.count == 100 do
    Article.create(title: Faker::Book.title, description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), when_went: Faker::Date.between(from: 10.years.ago, to: Date.today), country_id: countries.sample.id)
end

i = 0
until User.count == 20 do
  User.create(email: "test_user#{i}@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", photo: Faker::Avatar.image, name: Faker::Name.name)
  i += 1
end

articles = Article.all
users = User.all

until Comment.count == 1000 do
  Comment.create(content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), article_id: articles.sample.id, user_id: users.sample.id)
end

r_type = %w[article comment]
comments = Comment.all
kinds = Article::Kinds

until Reaction.count == 1000 do
  rel_type = r_type.sample
  if rel_type == "article"
    Reaction.create(article_id: articles.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
  else
    Reaction.create(comment_id: comments.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
  end
end