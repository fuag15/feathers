require 'spec_helper'

describe ApplicationHelper do
  describe '#bootstrap_class_for' do
    it 'should convert notice to info' do
      expect( helper.bootstrap_class_for(:notice)).to eq 'alert-info'
    end

    it 'should convert alert into block' do
      expect( helper.bootstrap_class_for(:alert)).to eq 'alert-block'
    end

    it 'should forward the rest of the types' do
      expect( helper.bootstrap_class_for(:error)).to eq 'alert-error'
    end
  end

  describe '#markdown' do
    it 'should convert text' do
      text = Forgery(:lorem_ipsum).words 10
      expect( helper.markdown(text)).to eq "<p>#{text}</p>\n".html_safe
    end
  end
end
