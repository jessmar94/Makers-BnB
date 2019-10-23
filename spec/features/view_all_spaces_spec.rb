feature 'user can view all spaces' do
  scenario 'spaces visable' do
    10.times {
      Space.create(name: "Space Name", description: "Testing", ppnd: 5000)
    }
    # user_signup
    # click_button('explore')
    visit '/view-spaces'
    # save_and_open_page
    expect(page).to have_content("Space Name")
  end
end
