feature "List" do
  scenario "User sees a list" do
    visit "/"
    expect(page).to have_content("List")
  end

  scenario "User can view bookmarked websites" do
    Link.create(url: "https://www.penisland.net", title: "Pens")
    visit "/"
    expect(page.status_code).to eq 200
    within "pens" do
      expect(page).to have_content ("Pens")
    end
  end
end
