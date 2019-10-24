feature 'user can view iundividual space page' do
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
    expect(page).to have_link 'Book this space'

  end

  scenario "shows the spaces availability" do
    space = Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    Availability.create(spaces_id: space.id, date_offered: '2019-10-31')
    Availability.create(spaces_id: space.id, date_offered: '2019-11-30')


    visit "/spaces/#{space.id}"
    save_and_open_page
    expect(page).to have_content "31 Oct"
    expect(page).to have_content "30 Nov"
  end
end
