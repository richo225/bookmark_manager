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
    adding_new_link
    expect(page).to have_content 'Github'
  end
end

feature 'adds a tag' do
  scenario 'creates the tag' do
    adding_new_link
    expect(page).to have_content 'course'
  end
end
