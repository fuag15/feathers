require 'spec_helper'

describe Project do
  it 'deletes any pictures associated with it' do
    @picture = FactoryGirl.create :picture_with_project
    expect{
      @picture.projects.first.destroy
    }.to change(Picture,:count).by -1
  end
end
