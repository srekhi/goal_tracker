require 'rails_helper'

feature 'creating a post' do
  scenario 'with missing author params' do
    create_post('Sunny rulez!')
    click_on 'Create post'
    expect(page).to have_content('Author can\'t be blank')
  end

  scenario 'body without a reference to Sunny' do
    create_post('sunster rulez!', 'Sunny')
    click_on 'Create post'
    expect(page).to have_content('Doesn\'t have a reference to Sunny! ')
  end

  scenario 'with valid params' do
    create_post('Sunny rulez!', 'Sunny')
    click_on 'Create post'
    expect(page).to have_content('Sunny rulez! Sunny')
  end

end
