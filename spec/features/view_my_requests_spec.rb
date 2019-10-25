feature 'My requests' do
  scenario 'I can see the requests I have made' do
    space = Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    # create a space is needed because of truncate database in test
    visit("/spaces/#{space.id}")
    click_button 'Request this space'
    expect(current_path).to eq("/requests")
    expect(page).to have_content 'My Requests'
  end

  scenario 'I can see the requests I have received' do
    space = Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    # create a space is needed because of truncate database in test
    visit("/spaces/#{space.id}")
    click_button 'Request this space'
    expect(page).to have_content "Requests I've Received"
  end
end
