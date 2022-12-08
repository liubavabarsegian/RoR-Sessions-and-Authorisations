# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mersenne', type: 'system' do
  it 'finds welcome' do
    visit root_path
    expect(page).to have_text('Log in please')
  end

  context 'when user is authorized ' do
    it 'should show message about authorization' do
        driver = Selenium::WebDriver.for :chrome
        driver.get('localhost:3000/form')
        driver.manage.timeouts.implicit_wait = 50
    
        driver.find_element(id: 'input').send_keys(1000)
        driver.find_element(id: 'btn').click
        driver.manage.timeouts.implicit_wait = 50
    
        flash = driver.find_element(id: 'flash').text
        expect(flash).to eq('Your have entered a non-positive value')
        driver.quit
      end
  end
  
end
