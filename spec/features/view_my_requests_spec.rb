feature 'My requests' do
  scenario 'I can see the requests I have made' do
    # Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    # create a space is needed because of truncate database in test
    user_signup
    click_button 'Explore'
    click_link 'See more...'
    click_button 'Request this space'
    save_and_open_page
    # expect(current_path).to eq('/requests')
    expect(page).to have_content 'My Requests'
  end

  scenario 'I can see the requests I have received' do
    # Space.create(name: "Space Name", description: "Testing", ppn: 5000)
    # create a space is needed because of truncate database in test
    user_signup
    click_button 'Explore'
    click_link 'See more...'
    click_button 'Request this space'
    expect(page).to have_content "Requests I've Received"
  end
end
