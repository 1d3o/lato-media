module LatoMedia
  class Doc::CellsController < Doc::DocController

    def elements_preview
      set_random_media
    end

    def inputs_media
      set_random_media
    end

    private

    def set_random_media
      medias = LatoMedia::Media.all

      if medias.empty?
        @media = LatoMedia::Media.new
      else
        @media = medias.sample
      end
    end

  end
end