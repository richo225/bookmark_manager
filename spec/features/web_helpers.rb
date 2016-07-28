def adding_new_link
  visit '/links/new'
  fill_in 'tag', with: 'course'
  fill_in 'title', with: 'Github'
  fill_in 'url', with: 'https://github.com'
  click_button 'bookmark'
end
