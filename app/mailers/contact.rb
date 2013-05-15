# Simple mailer that will do all our mails to midgard production
# this mailer is only used in PagesController#contact and PagesController#submit
# has only one mail
# contact::  Simple contact mail
class Contact < ActionMailer::Base
  default from: "contact@steelpigeondesign.com"

  # default sends from contact@midgardproductions.com but auto replies to the sender
  # from::  should be the sender
  # text:: body of the email
  def contact from, text
    @text = text
    mail(reply_to: from, subject: "Contact from #{from}")
  end
end
