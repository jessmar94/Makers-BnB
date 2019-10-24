feature "View spaces" do
  scenario "views all spaces hosted by the user" do

    user_signup
    click_button 'Host a space'
    click_button 'Add your space'
    # expect(current_path).to eq '/spaces/my-spaces'
    visit '/spaces/my-spaces'
    expect(page).to have_content "My Spaces"
    expect(page).to have_content "ID: 13, cool place"
  end
end
