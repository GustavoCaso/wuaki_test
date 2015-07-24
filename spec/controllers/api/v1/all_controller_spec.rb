require 'spec_helper'

describe Api::V1::AllController, type: :controller do
  it 'return all the content from the website' do
    create(:movie)
    episode = create(:episode)
    season = create(:season)
    season.episodes << episode
    get :index
    expect(response.status).to eq 200
    expect(response).to match_response_schema('content')
  end
end
