class Api::V1::AllController < Api::V1::BaseController

  def index
    render json:{
      "movies": serialize_movies,
      "seasons": serializes_season
    }
  end

  private
  def serialize_movies
    Movie.get_all_movies.map{ |x| MovieSerializer.new(x).as_json }
  end

  def serializes_season
    Season.get_all_seasons.map{ |x| SeasonSerializer.new(x).as_json }
  end
end
