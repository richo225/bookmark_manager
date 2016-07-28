feature "Filtering links" do
  scenario "User filters a link by tag" do
    visit '/'
    click_link 'Add links'
    fill_in 'title', with: 'added_link'
    fill_in 'url', with: 'url_link'
    fill_in 'tag', with: 'tag'
    click_button 'submit'

    visit '/'
    click_link 'Add links'
    fill_in 'title', with: 'something_different'
    fill_in 'url', with: 'url_different'
    fill_in 'tag', with: 'bubbles'
    click_button 'submit'

    visit 'tags/bubbles'
    expect(page).to have_content ('url_different')
    expect(page).not_to have_content ('url_link')

  end
end

# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag
