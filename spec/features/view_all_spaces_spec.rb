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

  scenario "shows the spaces availability" do
    10.times {
      space = Space.create(name: "Space Name", description: "Testing", ppn: 5000)
      dates = ['2019-10-31','2019-11-02','2019-12-03']
      dates.each do |date| 
        Availability.create(spaces_id: space.id, date_offered: date)
      end
    }
    visit '/spaces'
    save_and_open_page
    expect(page).to have_content "31 Oct"
    expect(page).to have_content "02 Nov"
    expect(page).to have_content "03 Dec"
  end
end
