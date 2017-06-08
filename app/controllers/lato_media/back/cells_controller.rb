module LatoMedia

  # This class contains actions used by media cells.
  class Back::CellsController < Back::BackController

    def inputs_media_pagination
      @name = params[:name]
      @page = ((params[:page] && params[:page].to_i > 0) ? params[:page].to_i : 1)
      @per_page = ((params[:per_page] && params[:per_page].to_i > 0) ? params[:per_page].to_i : 12)
      @medias = core__paginate_array(LatoMedia::Media.all.reverse, @per_page, @page)
      @pagination_total = (LatoMedia::Media.all.length / @per_page.to_f).ceil

      respond_to do |r|
        r.js
      end
    end

    def inputs_media_select
      @media = LatoMedia::Media.find_by(id: params[:id])
      @media = LatoMedia::Media.new unless @media
      @name = params[:name]

      respond_to do |r|
        r.js
      end
    end

  end
end
