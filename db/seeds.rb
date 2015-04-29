require 'faker'


5.times do
  category_names = {
    :name => Faker::Lorem.word
  }
  Category.create(category_names)
  puts "seeding categories"
end


50.times do
  article_names = {
    :title => Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6),
    :description => Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3),
    :category_id =>
  }
  Article.create(article_names)
  puts "seeding articles"
end
