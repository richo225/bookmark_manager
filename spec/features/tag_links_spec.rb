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

  scenario "User adds multiple tags to link" do
    visit '/'
    click_link 'Add links'
    fill_in 'title', with: 'added_link'
    fill_in 'url', with: 'url_link'
    fill_in 'tag', with: 'tag1 tag2'
    click_button 'submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include "tag1", "tag2"
  end
end
