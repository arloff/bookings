describe "creating a booking", type: :feature do
  #before :each do
  #  User.make(email: 'user@example.com', password: 'password')
  #end

  it "signs me in" do
    visit '/bookings/new'
    # within("#session") do
      fill_in 'booking_person_first_name', with: ''
      fill_in 'Password', with: 'password'
    # end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
  
