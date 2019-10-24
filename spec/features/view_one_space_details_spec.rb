feature 'user can view details for one space' do
  scenario 'spaces name is visable' do
    space = Space.create(name: "Space Name", description: "Testing", ppnd: 5000)
    visit '/spaces'
    click_link('See more...')

    expect(current_path).to eq("/spaces/#{space.id}")
    expect(page).to have_content "Space Name"
  end

  scenario 'user can go back to spaces page' do
    space = Space.create(name: "Space Name", description: "Testing", ppnd: 5000)
    visit '/spaces'
    click_link('See more...')
    click_link('Go back...')
    expect(current_path).to eq("/spaces")
  end
end
