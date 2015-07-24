require 'spec_helper'

describe Episode do
  before(:each) do
    @season = create(:season)
    @episode = create(:episode, season: @season)
  end
  describe 'Validations' do
    context 'Invalid number' do
      it 'will trigger error on duplicate number for season' do
        error_episode = build(:episode, title: 'Error', plot: 'BOOM', number: 1, season: @season)
        expect(error_episode).to have(1).errors_on(:number)
      end
    end

    context 'Valid number' do
      it 'will not trigger error for same number diferrent season' do
        season = create(:season, title: 'Hello', plot: 'World', price: 1.00)
        episode = create(:episode, title: 'Fisrt ever episode', plot: 'nothing special', number: 1, season: season)
        expect(@episode).to be_valid
        expect(episode).to be_valid
      end
    end
  end

  describe 'Instances Methods' do
    it '#total_episodes' do
      expect(@episode.total_episodes).to eq 1
      episode2 = create(:episode, title: 'testing', plot: 'The same ting', number: 2, season: @season)
      expect(episode2.total_episodes).to eq 2
      expect(@episode.total_episodes).to eq 2
    end
  end
end
