# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'


FIELDS = ["FullStack Developper", "Back-end Developper", "Front-end Developper", "UX Designer", "Product Manager"]
TAGS = %w[original sympa créatif utilitaire éducation networking travail design culture sorties alcool technologie amour productivité sport]


def new_users
  password = '123456'

  array = []

  basile = User.new(
    first_name: 'Basile',
    last_name: 'Quinchon',
    github_name: 'basilequinchon',
    field: FIELDS.sample,
    password: password,
    email: 'basile@idea.box'
  )

  array << basile

  thibaud = User.new(
    first_name: 'Thibaud',
    last_name: 'Allain',
    github_name: 'thibaudallain',
    field: FIELDS.sample,
    password: password,
    email: 'thibaud@idea.box'
  )

  array << thibaud

  alain = User.new(
    first_name: 'Alain',
    last_name: 'Kong',
    github_name: 'alainkp',
    field: FIELDS.sample,
    password: password,
    email: 'alain@idea.box'
  )

  array << alain

  carla = User.new(
    first_name: 'Carla',
    last_name: 'Dessommes',
    github_name: 'carladss',
    field: FIELDS.sample,
    password: password,
    email: 'carla@idea.box'
  )

  array << carla

  remy = User.new(
    first_name: 'Remy',
    last_name: 'Phan',
    github_name: 'phanremy',
    field: FIELDS.sample,
    password: password,
    email: 'remy@idea.box'
  )

  array << remy

  benjamin = User.new(
    first_name: 'Benjamin',
    last_name: 'Leray',
    github_name: 'benjyarel',
    field: FIELDS.sample,
    password: password,
    email: 'benjamin@idea.box'
  )

  array << benjamin

  coralie = User.new(
    first_name: 'Coralie',
    last_name: 'Loheac',
    github_name: 'coleopard',
    field: FIELDS.sample,
    password: password,
    email: 'coralie@idea.box'
  )

  array << coralie

  sergio = User.new(
    first_name: 'Sergio',
    last_name: 'Delgado',
    github_name: 'sdlgado',
    field: FIELDS.sample,
    password: password,
    email: 'sergio@idea.box'
  )

  array << sergio

  adelaide = User.new(
    first_name: 'Adelaide',
    last_name: 'Blot',
    github_name: 'AdelaideEurope',
    field: FIELDS.sample,
    password: password,
    email: 'adelaide@idea.box'
  )

  array << adelaide
  return array
end

def attach_photo_and_save(user_array)
  user_array.each do |user|
    attach_kitt_pic(user)
    p "Creating #{user.first_name} #{user.last_name}"
    user.save!
  end
end

def attach_kitt_pic(user)
  # url = "https://kitt.lewagon.com/placeholder/users/#{user.github_name}/"
  img = File.open('app/assets/images/profile.png')
  user.photo.attach(
    io: img,
    filename: "#{user.github_name}pic"
  )
end

if User.all.length < 1
  User.destroy_all
  attach_photo_and_save(new_users)
end

def create_idea(user)
  idea = Idea.new(
    title: Faker::Marketing.buzzwords,
    description: Faker::Lorem.paragraph(sentence_count: 6),
    figma_link: 'https://www.figma.com/file/Ghnt5fxEZ2Glf3S3WSz6Lj/Prototyping-in-Figma?node-id=0%3A1',
    github_link: 'https://github.com/basilequinchon/wagon-ideas-box',
    db_link: 'https://kitt.lewagon.com/db/3600'
  )
  rand(1..4).times do
    photo_url = "https://source.unsplash.com/featured/?coding"
    img = URI.open(photo_url)
    idea.photos.attach(io: img, filename: "#{idea.title}pic")
  end
  idea.user = user
  p "Creating #{idea.title} for user #{user.first_name}"
  idea.save!
end

def create_comment(idea)
  com = Comment.new(
    message: Faker::Lorem.sentence || Faker::Lorem.question || 'super',
    user_id: User.all.sample.id
  )
  com.idea = idea
  p "Creating #{com.message.truncate(10)}... for idea #{idea.title.truncate(10)}"
  com.save
end

def add_upvote_to_idea(user)
  Idea.all.each do |i|
    if user.ideas.all? { |c| c != i }
      rand(0..1).times { Upvote.create(user: user, idea: i) }
    end
  end
end

if User.all.length >= 5 && Idea.all.length < 5
  Idea.destroy_all
  User.all.each { |u| rand(1..4).times { create_idea(u) } }
  User.all.each { |u| add_upvote_to_idea(u) }
end

if Idea.all.length >= 5
  Comment.destroy_all
  Idea.all.each { |i| rand(3..10).times { create_comment(i) }}
end

Idea.all.each do |idea|
  rand(2..5).times do
    tag = TAGS.sample
    idea.tag_list.add(tag) if idea.tags.all? { |i| i != tag }
    idea.save
  end
end

# if Idea.all.length >= 5
#   Upvote.destroy_all
#   User.all.
# end
# t.bigint "idea_id"
# t.bigint "user_id"
# t.text "message"
