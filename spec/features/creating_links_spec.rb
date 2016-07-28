require 'spec_helper'

feature 'save website' do
  # let(:link) { double Link.create(url: 'url_link', title: "added_link") }
  scenario 'add title and address to BookmarkManager' do
    visit '/'
    click_link 'Add links'
    fill_in('title', with: 'added_link')
    fill_in('url', with: 'url_link')
    click_button 'submit'

    expect(current_path).to eq '/links'

    within "ul#links" do
      expect(page).to have_content 'added_link'
    end
  end
end
