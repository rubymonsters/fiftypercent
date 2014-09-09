# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  Event.create({
      title: 'Telemedicus Sommerkonferenz 2014',
      subtitle: 'Überwachung und Recht',
      date: 5.days.ago,
      city: 'Berlin',
      country: 'BRD',
      description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      main_url: 'https://www.telemedicus.info/soko14/',
      contact_url: 'vorstand@telemedicus.info',
      speaker_list_url: 'https://www.telemedicus.info/soko14/#speaker',
      tag_list: ['Sicherheit','Recht','Überwachung','NSA'],
      woman: 1,
      total: 15,
      category: 'Konferenz',
      reporter: 'Anne',
      reporter_url: 'https://twitter.com/annalist'
      })

[10, 20, 25, 30, 20, 40, 35].each do |percent_woman|
  Event.create({
    title: 'nr-jahreskonferenz 2014',
    subtitle: 'You’ll Never Walk Alone',
    date: 63.days.ago,
    city: 'Hamburg',
    country: 'BRD',
    description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
    main_url: 'http://netzwerkrecherche.org/wordpress/nr14/',
    contact_url: '',
    speaker_list_url: 'http://netzwerkrecherche.org/wordpress/nr14/referenten/',
    tag_list: ['Alone','Überwachung'],
    woman: percent_woman,
    total: 100,
    category: 'Konferenz',
    reporter: 'yetzt',
    reporter_url: '@yetzt'
    })
end

  #Event.create({
      #title: '',
      #subtitle: '',
      #date: 5.days.ago,
      #city: '',
      #country: '',
      #description: '',
      #main_url: '',
      #contact_url: '',
      #speaker_list_url: '',
      #woman: ,
      #total: ,
      #category: '',
      #reporter: '',
      #reporter_url: ''
      #})
