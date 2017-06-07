module LatoMedia
  class Doc::CellsController < Doc::DocController

    def elements_preview
      medias = LatoMedia::Media.all

      if medias.empty?
        @media = LatoMedia::Media.new
      else
        @media = medias.sample
      end
    end

    def inputs_media; end

  end
end