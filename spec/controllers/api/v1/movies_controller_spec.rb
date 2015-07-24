require 'spec_helper'

describe Api::V1::MoviesController, type: :controller do
  describe "Getting all the movies" do
    context 'with movies' do
      it 'return all the movies' do
        create(:movie)
        get :index
        expect(response.status).to eq 200
        expect(response).to match_response_schema('movies')
      end
    end

    context 'withpout movies' do
      it 'return error message' do
        get :index
        expect(response.status).to eq 204
        expect(json['message']).to eq 'No Movies'
      end
    end
  end

  describe 'Add Movie to user library' do
    before(:each) do
      @user = create(:user)
      @library = create(:library, user: @user)
      @library.movies << create(:movie)
    end

    context 'Missing user_id params' do
      it 'return error message' do
        post :create, movie_id: 1
        expect(response.status).to eq 400
        expect(json['error']).to eq 'You need to supply user_id'
      end
    end

    context 'Missing season_id params' do
      it 'return error message' do
        post :create, user_id: @user.id
        expect(response.status).to eq 400
        expect(json['error']).to eq 'You must supply movie_id'
      end
    end

    context 'Already in the library and havent expire' do
      it 'will return a error message saying the content is already in the library' do
        post :create, user_id: @user.id, movie_id: 1
        expect(response.status).to eq 200
        expect(json['message']).to eq 'Movie already in the library'
      end
    end

    context 'Already in the library and is expire' do
      it 'will add the content to the library' do
        @library.user_movies.first.update_attributes( expire_at: Time.now - 2.days )
        post :create, user_id: @user.id, movie_id: 1
        expect(response.status).to eq 201
        expect(response).to match_response_schema('movie')
      end
    end

    context 'Not in the library' do
      it 'will add the content to the library' do
        new_movie = create(:movie, title: 'Not in the library')
        post :create, user_id: @user.id, movie_id: new_movie.id
        expect(response.status).to eq 201
        expect(response).to match_response_schema('movie')
      end
    end

  end
end
