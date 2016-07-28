feature "Tagging links" do
  scenario "User adds tag to link" do
    visit '/'
    click_link 'Add links'
    fill_in 'title', with: 'added_link'
    fill_in 'url', with: 'url_link'
    fill_in 'tag', with: 'tag'
    click_button 'submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include 'tag'
  end
end
