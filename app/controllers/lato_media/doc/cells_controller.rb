module LatoMedia
  class Doc::CellsController < Doc::DocController

    def elements_preview
      set_random_media
    end

    def elements_previews
      set_random_medias(10)
    end

    def inputs_media
      set_random_media
    end

    def inputs_gallery
      set_random_medias(10)
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

    def set_random_medias(qnt)
      @medias = []
      medias = LatoMedia::Media.all
      qnt.times do
        media = medias.sample
        media = LatoMedia::Media.new unless media
        @medias.push(media)
      end
    end

  end
end
