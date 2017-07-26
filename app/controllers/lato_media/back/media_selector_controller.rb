module LatoMedia

  # This class contains actions used by media cells.
  class Back::MediaSelectorController < Back::BackController

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

  end
end
