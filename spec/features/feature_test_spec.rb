require 'spec_helper'

feature 'shows list of links' do
  scenario 'of regularly visited websites' do
    Link.create(title: 'some_name', url: 'some_url')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('some_name')
    end
  end
end

feature 'save links' do
  scenario 'with name and address' do
    visit '/links/new'
    fill_in 'title', with: 'Github'
    fill_in 'url', with: 'https://github.com'
    click_button 'bookmark'
    expect(page).to have_content 'Github'
  end
end
