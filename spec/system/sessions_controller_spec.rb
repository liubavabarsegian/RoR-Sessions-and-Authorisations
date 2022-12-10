# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe SessionsController, type: 'system' do
  include RSpec::Expectations

  it 'should create an account' do
    visit new_path
    @email = 'test@test'
    fill_in 'su-nick', with: 'test'
    fill_in 'su-email', with: @email
    fill_in 'su-password', with: 'test'
    click_button 'Sign Up'
    expect(page).to have_text("User was successfully created. Welcome, #{@email}!")
  end

  it 'should sign up and calculate' do
    visit new_path
    @email = 'test@test'
    fill_in 'su-nick', with: 'test'
    fill_in 'su-email', with: @email
    fill_in 'su-password', with: 'test'
    click_button 'Sign Up'
    fill_in 'input', with: '1235'
    click_button 'Найти числа Мерсена до n'
    expect(find('#result-4')).to have_text('127')
  end

  it 'should not calculate' do
    visit form_path
    fill_in 'input', with: '1235'
    click_button 'Найти числа Мерсена до n'
    expect(page).to have_text("Log in for calculating")
  end
end
