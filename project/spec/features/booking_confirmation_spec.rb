feature 'user can confirm booking made to their space' do
  scenario 'user can see request to their space' do
    sign_up
    create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
    sign_out
    sign_up(email_address: 'bartjudge@me.com')
    book_space('Barts Place')
    sign_out
    sign_in(email_address: "bkluczynski@gmail.com", password: '12345')
    visit('/requests')
    within 'ul#received_requests' do
        expect(page).to have_content('Barts Place')
    end

  end
end
