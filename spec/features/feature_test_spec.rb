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

feature 'adds tags' do
  scenario 'creates a tag' do
    adding_new_link
    link = Link.first
    expect(link.tags.map(&:name)).to include 'course'
  end
  scenario 'creates multiple tags' do
    visit'/links/new'
    fill_in 'title', with: 'Makers'
    fill_in 'url', with: 'https://makersacadeny.com'
    fill_in 'tag', with: 'course, ronin, coding'
    click_button 'bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include 'course'
    expect(link.tags.map(&:name)).to include 'ronin'
    expect(link.tags.map(&:name)).to include 'coding'
  end
end

feature 'filter links' do
  scenario 'check links with tag' do
    adding_new_link
    visit '/links/new'
    fill_in 'title', with: 'Yahoo'
    fill_in 'url', with: 'https://yahoo.com'
    fill_in 'tag', with: 'bubbles'
    click_button 'bookmark'

    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    expect(page).to have_content("Yahoo")
    expect(page).not_to have_content("Github")
  end
end

feature 'create user account' do
  before do
    visit '/sign-up'
    fill_in 'username', with: 'Fran'
    fill_in 'password', with: 'guitar1234'
  end
  scenario 'I can sign up as a new user' do
    fill_in 'email', with: 'fran@makers.com'
    fill_in 'password confirmation', with: 'guitar1234'
    expect{ click_button 'signup' }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Fran')
    expect(User.first.email).to eq('fran@makers.com')
    expect(page).not_to have_content("Please enter matching passwords")
  end

  scenario "Sign up fails if passwords don't match" do
    fill_in 'email', with: 'fran@makers.com'
    fill_in 'password confirmation', with: 'drums1234'
    expect{ click_button 'signup' }.to change(User, :count).by(0)
    expect(page).to have_content("Please enter matching passwords")
  end

  scenario "Sign up fails if email is empty" do
    expect(page).to have_content("Please enter your e-mail")
  end 

end
