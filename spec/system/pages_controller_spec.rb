# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mersenne', type: 'system' do
  it 'finds welcome' do
    visit root_path
    expect(page).to have_text('Log in please')
  end
end
