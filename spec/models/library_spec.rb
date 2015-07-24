require 'spec_helper'

describe Library do
  describe 'Associations' do
    before(:each) do
      @user = create(:user)
      @movie = create(:movie)
      @season = create(:season)
      @library = create(:library, user: @user)
    end

    context 'Movies' do
      it 'has_many movies' do
        @library.movies << @movie
        expect(@library.movies).to eq [@movie]
      end

      it 'update the purchased_at on create' do
        stub_time = Time.parse('29 Sept 1986')
        allow(Time).to receive(:now).and_return(stub_time)
        @library.movies << @movie
        expect(@library.user_movies.first.purchased_at).to eq stub_time
      end
    end

    context 'Seasons' do
      it 'has_many seasons' do
        @library.seasons << @season
        expect(@library.seasons).to eq [@season]
      end

      it 'update the purchased_at on create' do
        stub_time = Time.parse('29 Sept 1986')
        allow(Time).to receive(:now).and_return(stub_time)
        @library.seasons << @season
        expect(@library.user_seasons.first.purchased_at).to eq stub_time
      end
    end

    context 'User' do
      it 'belongs to an user' do
        expect(@library.user).to eq @user
      end
    end

  end
end
