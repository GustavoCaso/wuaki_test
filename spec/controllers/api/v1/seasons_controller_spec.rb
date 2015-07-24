require 'spec_helper'

describe Api::V1::SeasonsController, type: :controller do
  describe "Getting all the seasons" do
    context 'with season' do
      it 'return all the seasons' do
        episode = create(:episode)
        season = create(:season)
        season.episodes << episode
        get :index
        expect(response.status).to eq 200
        expect(response).to match_response_schema('seasons')
      end
    end

    context 'withpout season' do
      it 'return error message' do
        get :index
        expect(response.status).to eq 204
        expect(json['message']).to eq 'No Seasons'
      end
    end
  end

  describe 'Add Season to user library' do
    before(:each) do
      @user = create(:user)
      @library = create(:library, user: @user)
      @season = create(:season)
      @season.episodes << create(:episode)
      @library.seasons << @season
    end

    context 'Missing user_id params' do
      it 'return error message' do
        post :create, season_id: @season.id
        expect(response.status).to eq 400
        expect(json['error']).to eq 'You need to supply user_id'
      end
    end

    context 'Missing season_id params' do
      it 'return error message' do
        post :create, user_id: @user.id
        expect(response.status).to eq 400
        expect(json['error']).to eq 'You must supply season_id'
      end
    end

    context 'Already in the library and havent expire' do
      it 'will return a error message saying the content is already in the library' do
        post :create, user_id: @user.id, season_id: @season.id
        expect(response.status).to eq 200
        expect(json['message']).to eq 'Season already in the library'
      end
    end
    context 'Already in the library and is expire' do
      it 'will add the content to the library' do
        @library.user_seasons.first.update_attributes( expire_at: Time.now - 2.days )
        post :create, user_id: @user.id, season_id: @season.id
        expect(response.status).to eq 201
        expect(response).to match_response_schema('season')
      end
    end
    context 'Not in the library' do
      it 'will add the content to the library' do
        new_season = create(:season, title: 'The new killing series')
        new_season.episodes << create(:episode, title: 'Hello world')
        post :create, user_id: @user.id, season_id: new_season.id
        expect(response.status).to eq 201
        expect(response).to match_response_schema('season')
      end
    end
  end
end
