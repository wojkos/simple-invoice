# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @product_1 = FactoryGirl.create(:product, name: 'Ruby world', code: 'aaa')
  end
  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should respond_to(:code) }

  it '#name should be unique and at least 1 chars' do
    expect(FactoryGirl.build(:product, name: 'Ruby')).to be_valid
    expect(FactoryGirl.build(:product, name: 'X')).to be_valid
    expect(FactoryGirl.build(:product, name: 'Ruby world')).not_to be_valid
    expect(FactoryGirl.build(:product, name: '')).not_to be_valid
    expect(FactoryGirl.build(:product, name: nil)).not_to be_valid
  end

  it '#code should be unique and at least 1 chars' do
    expect(FactoryGirl.build(:product, code: '12w')).to be_valid
    expect(FactoryGirl.build(:product, code: 'X')).to be_valid
    expect(FactoryGirl.build(:product, code: 'aaa')).not_to be_valid
    expect(FactoryGirl.build(:product, code: '')).not_to be_valid
    expect(FactoryGirl.build(:product, code: nil)).not_to be_valid
  end

  it '#price should be number and greater then 0' do
    expect(FactoryGirl.build(:product, price: 5)).to be_valid
    expect(FactoryGirl.build(:product, price: 123.32)).to be_valid
    expect(FactoryGirl.build(:product, price: 0)).not_to be_valid
    expect(FactoryGirl.build(:product, price: -1)).not_to be_valid
    expect(FactoryGirl.build(:product, price: 'aaa')).not_to be_valid
    expect(FactoryGirl.build(:product, price: '')).not_to be_valid
    expect(FactoryGirl.build(:product, price: nil)).not_to be_valid
  end
end
