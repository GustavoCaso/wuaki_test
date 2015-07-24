require 'spec_helper'

describe Api::V1::LibrariesController, type: :controller do
  context 'No user' do
    it 'will return error message' do
      get :show
      expect(response.code).to eq "400"
      expect(json['error']).to eq 'You need to supply user_id'
    end
  end

  context 'No library' do
    it 'will render message and no content status' do
      user = create(:user)
      get :show, user_id: user.id
      expect(response.code).to eq "204"
      expect(json['message']).to eq 'Library empty'
    end
  end

  context 'With user and library' do
    it 'return library' do
      user = create(:user)
      library = create(:library, user: user)
      season = create(:season)
      season.episodes << create(:episode)
      library.movies << create(:movie)
      library.seasons << season
      get :show, user_id: user.id
      expect(response.code).to eq "200"
      expect(response).to match_response_schema('content')
    end
  end
end
