feature 'user can view individual space page' do
  scenario 'spaces name is visable' do
    space = Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    visit '/spaces'
    click_link('See more...')

    expect(current_path).to eq("/spaces/#{space.id}")
    expect(page).to have_content "Space Name"
  end

  scenario 'user can go back to spaces page' do
    Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    visit '/spaces'
    click_link('See more...')
    click_link('Go back')
    expect(current_path).to eq("/spaces")
  end

  scenario 'user can book the space' do
    Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    visit '/spaces'
    click_link('See more...')
    expect(page).to have_button 'Request this space'
  end

  # we no longer need this test with the datepicker

  # scenario "shows the spaces availability" do
  #   space = Space.create(name: "Space Name", description: "Testing", ppn: 5000)
  #
  #   dates = ['2019-10-31','2019-11-02','2019-12-03']
  #   dates.each do |date|
  #     Availability.create(spaces_id: space.id, date_offered: date)
  #   end
  #
  #   visit "/space/:#{space.id}"
  #
  #   Availability.create(spaces_id: space.id, date_offered: '2019-10-31')
  #   Availability.create(spaces_id: space.id, date_offered: '2019-11-30')
  #
  #
  #   visit "/spaces/#{space.id}"
  #
  #   save_and_open_page
  #   expect(page).to have_content "31 Oct"
  #   expect(page).to have_content "30 Nov"
  # end
end
