class Api::V1::LibrariesController < Api::V1::BaseController
  before_filter :find_user
  before_filter :find_library

  def show
    if @library
      render json: @library, status: :ok
    else
      render json: {message: 'Library empty'}, status: :no_content
    end
  end

  private
  def find_library
    @library ||= @user.library.try(:get_all_content_by_time_to_watch)
  end
end
