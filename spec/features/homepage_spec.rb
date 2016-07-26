feature "List" do
  scenario "User can access links page" do
    visit "/links"
    expect(page.status_code).to eq 200
  end

  scenario "User can view bookmarked websites" do
    Link.create(url: "https://www.penisland.net", title: "Pens")
    visit "/links"
    expect(page).to have_content ("Pens")
  end
end
