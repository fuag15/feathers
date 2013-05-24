require 'spec_helper'

describe ResumeCategory do
  it 'deletes any resume entries associated with it' do
    @resume_entry = FactoryGirl.create :resume_entry
    expect{
      @resume_entry.resume_category.destroy
    }.to change(ResumeEntry,:count).by -1
  end
end
