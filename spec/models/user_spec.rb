require 'spec_helper'
require 'cancan/matchers'

describe User do
  it 'says its an admin if its an admin' do
    admin = FactoryGirl.create :user, role: 'admin'
    expect(admin.admin?).to eq true
  end

  it 'says its not an admin if it isnt an admin' do
    admin = FactoryGirl.create :user
    expect(admin.admin?).to eq false
  end

  describe 'abilities' do
    context 'when I am an admin' do
      before do
        @user = FactoryGirl.create :user, role: 'admin'
      end

      it 'should be able to manage articles' do
        expect(@user).to have_ability(:manage, for: FactoryGirl.create(:article))
      end

      it 'should be able to manage images' do
        expect(@user).to have_ability(:manage, for: FactoryGirl.create(:image))
      end
    end

    context 'when I am not an admin' do
      before do
        @user = FactoryGirl.create :user
      end

      it 'should be able to manage articles' do
        expect(@user).not_to have_ability(:manage, for: FactoryGirl.create(:article))
      end

      it 'should be able to manage images' do
        expect(@user).not_to have_ability(:manage, for: FactoryGirl.create(:image))
      end
    end
  end
end