feature 'user can view all spaces' do
  scenario 'spaces name is visable' do
    10.times {
      Space.create(name: "Space Name", description: "Testing", ppnd: 5000)
    }
    # user_signup
    # click_button('explore')
    visit '/view-spaces'
    expect(page).to have_content("Space Name")
    
  end
  
  scenario "page shows the space's description" do
    space = Space.create(name: "Different Space", description: "Hello world", ppnd: 10000)
    visit '/view-spaces'
    save_and_open_page
    within "##{space.id}" do
      expect(page).to have_content "Different Space"
    end
  end
end
