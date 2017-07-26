module LatoMedia
  class Back::MediasController < Back::BackController

    skip_before_action :verify_authenticity_token, only: [:create]

    before_action do
      core__set_menu_active_item('media_medias')
    end

    def index
      core__set_header_active_page_title(LANGUAGES[:lato_media][:pages][:medias])
      set_index_variables((params[:page] ? params[:page].to_i : 1))
    end

    def refresh_index
      set_index_variables(1)
      respond_to do |r|
        r.js
      end
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
      @media = LatoMedia::Media.find_by(id: params[:id])
      return unless check_media_presence
    end

    def update
      @media = LatoMedia::Media.find_by(id: params[:id])
      return unless check_media_presence

      unless @media.update(media_params)
        flash[:danger] = @media.errors.full_messages.to_sentence
        redirect_to lato_media.medias_path
        return
      end

      flash[:success] = LANGUAGES[:lato_media][:flashes][:media_update_success]
      redirect_to lato_media.medias_path
    end

    def destroy
      @media = LatoMedia::Media.find_by(id: params[:id])
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

    def media_params
      params.require(:media).permit(:title, :description)
    end

    def set_index_variables(page)
      medias = LatoMedia::Media.all.order('created_at DESC')
      @pagination_current = page
      @pagination_total = (medias.length.to_f / 24.to_f).ceil
      @medias = core__paginate_array(medias, 24, page)
    end

  end
end
