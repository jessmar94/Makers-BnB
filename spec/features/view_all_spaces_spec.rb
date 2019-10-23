feature 'options to view or host' do
  scenario 'user can choose to view' do
    user_signup
    click_button('explore')
    expect(page).to have_content('hello')
  end
end
