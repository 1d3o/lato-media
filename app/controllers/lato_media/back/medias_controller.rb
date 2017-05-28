module LatoMedia
  class Back::MediasController < Back::BackController

    before_action do
      core__set_menu_active_item('media_medias')
    end

    def index
      core__set_header_active_page_title(LANGUAGES[:lato_media][:pages][:medias])
      @medias = LatoMedia::Media.all.order('created_at DESC')
    end

    def show
      # use edit as default media show page
      redirect_to lato_media.edit_media_path(params[:id])
    end

    def new
      core__set_header_active_page_title(LANGUAGES[:lato_media][:pages][:medias_new])
    end

    def create
      @media = LatoMedia::Media.new(attachment: params[:file])

      unless @media.save
        render json: { error: @media.errors.full_messages.to_sentence }, status: 400
        return
      end

      render json: {}, status: 200
    end

    def edit
      core__set_header_active_page_title(LANGUAGES[:lato_media][:pages][:medias_edit])
      @media = LatoMedia::Media.find_by(params[:id])
      return unless check_media_presence
    end

    def update; end

    def destroy
      @media = LatoMedia::Media.find_by(params[:id])
      return unless check_media_presence

      unless @media.destroy
        flash[:danger] = @media.errors.full_messages.to_sentence
        redirect_to lato_media.medias_path
        return
      end

      flash[:success] = LANGUAGES[:lato_media][:flashes][:media_destroy_success]
      redirect_to lato_media.medias_path
    end

    private

    # This function checks the @media variable is present and redirect to index if it not exist.
    def check_media_presence
      unless @media
        flash[:warning] = LANGUAGES[:lato_media][:flashes][:media_not_found]
        redirect_to lato_media.medias_path
        return false
      end

      true
    end

  end
end
