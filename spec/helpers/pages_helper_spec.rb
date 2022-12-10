# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PagesHelper, type: :helper do
  it 'checks whether the number is prime and returns true or false ' do
    expect(helper.prime?(-1)).to eq(false)
    expect(helper.prime?(0)).to eq(false)
    expect(helper.prime?(1)).to eq(false)
    expect(helper.prime?(2)).to eq(true)
    expect(helper.prime?(7)).to eq(true)
    expect(helper.prime?(21)).to eq(false)
  end

  it 'checks whether the number is a mersenne number' do
    expect(helper.mersenne?(31)).to eq(true)
    expect(helper.mersenne?(6)).to eq(false)
  end

  it 'finds mersenne numbers to n' do
    expect(helper.mersenne_to_n(150_000)).to eq([3, 7, 31, 127, 8191, 131_071])
    expect(helper.mersenne_to_n(10)).to eq([3, 7])
    expect(helper.mersenne_to_n(0)).to eq([])
    expect(helper.mersenne_to_n(-10)).to eq([])
  end
end
