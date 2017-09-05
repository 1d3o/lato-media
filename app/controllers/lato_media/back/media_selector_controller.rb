module LatoMedia

  # This class contains actions used by media cells.
  class Back::MediaSelectorController < Back::BackController

    skip_before_action :verify_authenticity_token, only: [:add_media]    

    def load_index
      medias = LatoMedia::Media.all
      # set data for view
      @page = ((params[:page] && params[:page].to_i > 0) ? params[:page].to_i : 1)
      @pagination_total = (medias.length / 12.to_f).ceil
      @medias = core__paginate_array(medias.reverse, 12, @page)

      respond_to do |r|
        r.js
      end
    end

    def load_form
      # reload cells settings
      core__cells_initialize

      respond_to do |r|
        r.js
      end
    end

    def load_inputs_media
      value = params[:value] ? params[:value].to_i : nil
      media = LatoMedia::Media.find_by(id: params[:value])
      # set values for render
      @media = media ? media : LatoMedia::Media.new
      @id = params[:id]
    end

    def load_inputs_gallery
      value = params[:value].split(',')
      # set values for render
      @medias = LatoMedia::Media.where(id: value)
      @id = params[:id]
    end

    def add_media
      @media = LatoMedia::Media.new(attachment: params[:file])

      unless @media.save
        render json: { error: @media.errors.full_messages.to_sentence }, status: 400
        return
      end

      render json: {}, status: 200
    rescue => e
      puts e
      render json: { error: 'There was an internal error' }, status: 500
    end

  end
end
