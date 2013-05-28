require "spec_helper"

describe Contact do
  describe 'contact' do
    let :mail do
      Contact.contact Forgery(:email), Forgery(:lorem_ipsum).words(10)
    end

    #ensure that the sender is correct
    it 'renders the sender' do
      expect(mail.from).to match_array ['contact@steelpigeondesign.com']
    end
  end
end