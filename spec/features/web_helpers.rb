def adding_new_link
  visit '/links/new'
  fill_in 'title', with: 'Github'
  fill_in 'url', with: 'https://github.com'
  fill_in 'tag', with: 'course'
  click_button 'bookmark'
end
