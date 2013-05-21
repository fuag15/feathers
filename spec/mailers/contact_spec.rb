require "spec_helper"

describe Contact do
  describe 'contact' do
    let :mail do
      Contact.contact Forgery(:email), Fogery(:lorem_ipsum).words(10)
    end

    #ensure that the receiver is correct
    it 'renders the receiver' do
      expect(mail.to).to match_array [user.email]
    end

    #ensure that the sender is correct
    it 'renders the sender' do
      expect(mail.from).to match_array ['contact@steelpigeondesign.com']
    end
  end
end