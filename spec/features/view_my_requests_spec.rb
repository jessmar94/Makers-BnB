feature 'My requests' do
  scenario 'I can see the requests I have made' do
    user_signup
    click_button 'Explore'
    click_link 'See more...'
    click_button 'Request this space'
    expect(page).to have_content 'My Requests'
  end

  scenario 'I can see the requests I have received' do
    user_signup
    click_button 'Explore'
    click_link 'See more...'
    click_button 'Request this space'
    expect(page).to have_content "Requests I've Received"
  end
end
