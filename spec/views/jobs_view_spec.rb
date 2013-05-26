require 'spec_helper'

describe 'jobs/index' do
  before do
    jobs = FactoryGirl.create_list :job, 2
    assign :jobs, jobs
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end

describe 'jobs/edit' do
  before do
    job = FactoryGirl.create :job
    assign :job, job
    render
  end

  it 'renders _form partial for the job' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'jobs/new' do
  before do
    job = FactoryGirl.create :job
    assign :job, job
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end