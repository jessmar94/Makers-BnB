feature 'View homepage' do
  scenario 'view homepage' do
    visit '/'
    click_button 'sign up'
    expect(current_path).to eq '/user-options'
  end
end
