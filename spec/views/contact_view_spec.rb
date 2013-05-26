require 'spec_helper'

describe 'contact/index' do
  before do
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end