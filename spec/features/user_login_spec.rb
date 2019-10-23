feature 'User can login' do
  scenario 'when visiting homepage' do
    visit '/'
    expect(page).to have_button 'Login'
  end

  scenario 'user enters details to login' do
    visit '/'
    click_button 'Login'
    visit '/login'
    expect(page).to have_button 'Login'
  end
end
