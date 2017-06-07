module LatoMedia

  # This class contains actions used by media cells.
  class Back::CellsController < Back::BackController

    def inputs_media_pagination
      @name = params[:name]
      @page = ((params[:page] && params[:page].to_i > 0) ? params[:page].to_i : 1)
      @medias = core__paginate_array(LatoMedia::Media.all.reverse, 8, @page)

      respond_to do |r|
        r.js
      end
    end

  end
end
