# frozen_string_literal: true
users = []
STATES = Bulletin.aasm.states.map(&:name)

5.times do
  users << User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

7.times do
  category = Category.find_or_create_by(name: Faker::ProgrammingLanguage.name)
  bulletin_image = ['bulletin1.jpg', 'bulletin2.jpg', 'bulletin3.jpg', 'bulletin4.jpg', 'bulletin5.jpg'].map do |file_path|
    Rails.root.join("test/fixtures/files/#{file_path}")
  end

  20.times do
    bulletin = users.sample.bulletins.build(
      description: Faker::Lorem.paragraph,
      title: Faker::Lorem.sentence(word_count: 3),
      category: category,
      state: STATES.sample
    )
    bulletin.image.attach(io: File.open(bulletin_image.sample), filename: 'filename.jpg')
    bulletin.save
    sleep 1
  end
end