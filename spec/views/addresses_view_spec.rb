require 'spec_helper'

describe 'addresses/index' do
  before do
    addresses = FactoryGirl.create_list :address, 2
    assign :addresses, addresses
    render
  end

  it 'displays the image location' do
    expect(view).to render_template('index')
  end
end

describe 'addresses/edit' do
  before do
    address = FactoryGirl.create :address
    assign :address, address
    render
  end

  it 'renders _form partial for the address' do
    expect(view).to render_template( partial: '_form')
  end
end

describe 'addresses/new' do
  before do
    address = FactoryGirl.create :address
    assign :address, address
    render
  end

  it 'displays the image location' do
    expect(view).to render_template( partial: '_form')
  end
end