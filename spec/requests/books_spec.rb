require 'rails_helper'


describe 'Books API', type: :request do
  it 'returns all books' do
    FactoryBot.create(:book, title: '1984', author: 'George Orwell')
    FactoryBot.create(:book, title: 'Admiravel mundo novo', author: 'Aldous Huxley')

    get '/api/books'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
  end
end