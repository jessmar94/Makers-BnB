feature 'user can view all spaces' do
  scenario 'spaces name is visable' do
    10.times {
      Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    }
    # user_signup
    # click_button('explore')
    visit '/spaces'
    expect(page).to have_content("Space Name")

  end

  scenario "page shows the space's description" do
    10.times {
      Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    }
    space = Space.create(name: "Different Space", description: "Hello world", ppn: 10000)
    visit '/spaces'
    within "##{space.id}" do
      expect(page).to have_content "Hello world"
    end
  end

end
