feature 'View homepage' do

  scenario 'view homepage' do
    visit '/'
    expect(page).to have_button 'Sign Up'
  end
  
end
