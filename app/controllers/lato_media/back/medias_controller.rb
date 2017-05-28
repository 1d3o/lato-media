module LatoMedia
  class Back::MediasController < Back::BackController

    before_action do
      core__set_menu_active_item('media_medias')
    end

    def index
      core__set_header_active_page_title(LANGUAGES[:lato_media][:pages][:medias])
      @medias = LatoMedia::Media.all.order('created_at DESC')
    end

    def show; end

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
      @media = LatoMedia::Media.find_by(params[:id])
    end

    def update; end

    def destroy; end

  end
end
