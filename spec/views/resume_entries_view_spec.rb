require 'spec_helper'

describe 'resume_entries/index' do
  before do
    resume_entries = FactoryGirl.create_list :resume_entry, 2
    assign :resume_entries, resume_entries
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end

describe 'resume_entries/edit' do
  before do
    resume_entry = FactoryGirl.create :resume_entry
    assign :resume_entry, resume_entry
    render
  end

  it 'renders _form partial for the resume_entry' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'resume_entries/new' do
  before do
    resume_entry = FactoryGirl.create :resume_entry
    assign :resume_entry, resume_entry
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end