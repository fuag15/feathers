require 'spec_helper'

describe ProjectCategory do
  it 'deletes any projects associated with it' do
    @project = FactoryGirl.create :project
    expect{
      @project.project_category.destroy
    }.to change(Project,:count).by -1
  end
end
