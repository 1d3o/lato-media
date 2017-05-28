module LatoMedia

  # ApplicationController
  class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    def index
      redirect_to lato_media.medias_path
    end

  end
end
