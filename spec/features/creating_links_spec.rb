feature 'adding links' do
  scenario 'user adds links to be saved' do
    visit '/links/new'
    fill_in 'Add Title', with: 'google'
    fill_in 'Add URL', with: 'http://www.google.co.uk'
    click_button "submit"
    expect(current_path).to eq '/links'
    # within 'ul#links' do
    expect(page).to have_content("Title: google")
    expect(page).to have_content("URL: http://www.google.co.uk")
    # end
  end
end
