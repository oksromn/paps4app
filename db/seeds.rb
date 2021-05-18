# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Film.create(
  title: 'Властелин колец: Братство Кольца',
  year: 2001,
  genre: 'Фэнтези',
  company: 'New Line Cinema',
  producer: 'Питер Джексон',
  actors: 'Элайджа Вуд, Иэн Маккеллен, Орландо Блум, Вигго Мортенсен, Энди Серкис',
  cost: '$93 000 000',
  rating: '8.579',
  image_link: 'https://www.kino-teatr.ru/movie/posters/big/6/22276.jpg',
)

Film.create(
  title: 'Железный человек',
  year: 2008,
  genre: 'Фантастика',
  company: 'Marvel',
  producer: 'Джон Фавро',
  actors: 'Роберт Дауни, Гвинет Пэлтроу, Стэн Ли, Дон Чидл, Скарлетт Йоханссон',
  cost: '$140 000 000',
  rating: '7.902',
  image_link: 'https://www.kino-teatr.ru/movie/posters/big/6/22276.jpg',
)
