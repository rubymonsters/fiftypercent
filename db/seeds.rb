Faker::Config.locale = :de

Event.create({
  title: 'Carshow 3000',
  subtitle: 'the super car-show',
  description: 'It is such a super car show!',
  main_url: 'http://www.carshow.de',
  date: 3.month.ago,
  city: 'Hamburg',
  country_code: 'DE',
  organizers: "Car Inc.\nIntercar GmbH",
  contact_url: 'http://www.carshow.de/contact',
  speaker_list_url: 'http://www.carshow.de/speakers.html',
  woman: 2,
  total: 8,
  reporter: 'Horst',
  reporter_url: '@horst',
  internal_user_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  internal_admin_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  published_at: 2.days.ago
})

Event.create({
  title: 'Telemedicus Sommerkonferenz 2014',
  subtitle: 'Überwachung und Recht',
  description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
  main_url: 'https://www.telemedicus.info/soko14/',
  date: 5.days.ago,
  city: 'Berlin',
  country_code: 'DE',
  organizers: "Telemedicus AG",
  contact_url: 'vorstand@telemedicus.info',
  speaker_list_url: 'https://www.telemedicus.info/soko14/#speaker',
  tag_list: ['Sicherheit','Recht','Überwachung','NSA'],
  woman: 1,
  total: 15,
  reporter: 'Anne',
  reporter_url: 'https://twitter.com/annalist',
  internal_user_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  internal_admin_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
})

10.times do
  [10, 20, 25, 30, 20, 40, 35].each do |percent_woman|
    Event.create({
      title:               "#{Faker::Commerce.department} Konferenz",
      subtitle:            Faker::Company.catch_phrase,
      description:         Faker::Lorem.paragraph,
      main_url:            Faker::Internet.url,
      date:                percent_woman.days.ago,
      city:                Faker::Address.city,
      country_code:        'DE',
      organizers:          Faker::Company.name,
      contact_url:         Faker::Internet.url,
      speaker_list_url:    Faker::Internet.url,
      tag_list:            Faker::Lorem.words(4),
      woman:               percent_woman,
      total:               130,
      category:            'Konferenz',
      reporter:            Faker::Name.name,
      reporter_url:        Faker::Internet.email,
      published_at:        2.days.ago,
      internal_user_info:  Faker::Lorem.paragraph,
      internal_admin_info: Faker::Lorem.paragraph
      })
  end
end

event_count = Event.count
210.times do
  event_id = Event.offset(rand(event_count)).first.id
  Comment.create({
    title:            Faker::Company.catch_phrase,
    body:             Faker::Lorem.paragraphs(rand(6)+1).join("\n\n"),
    author:           Faker::Name.name,
    public_contact:   Faker::Internet.url,
    internal_contact: Faker::Internet.email,
    commentable_id:   event_id,
    commentable_type: Event
  })
end

User.create(email: 'horst@mail.com', password:'geheim')

5.times do
  Page.blog_posts.create!({
    title:            Faker::Lorem.sentence(3, true, 4),
    body:             Faker::Lorem.paragraphs(rand(6)+1).join("\n\n"),
    slug:             Faker::Address.postcode
    })
end

category = [ "Intern", "ähnliche Projekte", "Erfolge" ]

category.each do | cat |
  BlogCategory.create!(
      name:             cat,
      rank:             Random.rand(99),
      slug:             Faker::Address.postcode
      )
end
