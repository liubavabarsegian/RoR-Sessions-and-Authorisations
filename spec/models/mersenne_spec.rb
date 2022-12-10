# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mersenne, type: :model do
  describe 'validations' do
    context 'presense' do
      it { should validate_presence_of(:num).with_message('не может быть пустым') }
    end
    context 'when num is not a digit' do
      it { should_not allow_value(Faker::Lorem.word).for(:num) }
    end

    context 'when num is a digit' do
      it { should allow_value(Faker::Number.number).for(:num) }
    end
  end

  describe 'adding new invalid data to db' do
    let(:params) { { num: -10 } }
    subject { described_class.new(params) }
    it 'will not add that to db' do
      expect(described_class.where(num: -10)).to eq([])
    end
  end

  describe 'adding new valid data to db' do
    let(:params) { { num: 101 } }
    subject { described_class.new(params) }
    it 'will add that to db' do
      expect(described_class.where(num: 101)).not_to be_nil
    end
  end

  describe 'adding duplicate data to db' do
    let(:params) { { num: 102 } }
    it 'will be invalid' do
      described_class.create(params).save
      expect { described_class.create!(params) }.to raise_error
    end
  end

  describe 'finding existing data to db' do
    it 'will find the data' do
      described_class.insert_all([{ num: 890, result: [3, 7, 31, 127], count: 4 }])
      expect(described_class.find_by(num: 890)).not_to eq([])
      described_class.order('created_at').last.delete
    end
  end
end
