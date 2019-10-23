feature 'options to view or host' do
  scenario 'user can choose to view' do
    user_signup
    save_and_open_page
    click_button('explore')
    expect(page).to have_content('hello')
  end
end
