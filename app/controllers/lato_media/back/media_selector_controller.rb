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

  end
end
