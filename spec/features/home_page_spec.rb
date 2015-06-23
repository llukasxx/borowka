feature "User" do
  scenario "is not logged in and visits home page" do
    visit root_path
    expect(page).to have_content 'Borówka'
    expect(page).to have_content 'Zaloguj'
  end
end