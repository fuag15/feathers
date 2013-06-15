# initialize application wide settings
$ ->
  # if there is a ligttbox link, ititialize it
  $('a.lightbox').lightbox()
  # if our social links are present, intialize them
  $('.social').jsocial
    github: 'fuag15'
    linked: 'www.linkedin.com/profile/view?id=108274102&trk=tab_pro'
    newPage: true
    center: false
    inline: true
  # fade out alerts
  $('.alert').fadeOut 'slow'