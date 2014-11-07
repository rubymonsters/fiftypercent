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
  internal_admin_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
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
      title: "Generic-Conf 20#{percent_woman}",
      subtitle: 'Where default meets average',
      description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      main_url: 'http://generic-inc.com/wordpress/nr14/',
      date: percent_woman.days.ago,
      city: 'Hamburg',
      country_code: 'DE',
      organizers: "Generic Inc. u. Local Group",
      contact_url: 'http://generic-inc.com/contact.html',
      speaker_list_url: 'http://generic-inc.org/wordpress/nr14/referenten/',
      tag_list: ['alone','überwachung', 'gerneric topic'],
      woman: percent_woman,
      total: 100,
      category: 'Konferenz',
      reporter: 'yetzt',
      reporter_url: '@yetzt'
      })
  end
end

User.create(email: 'horst@mail.com', password:'geheim')