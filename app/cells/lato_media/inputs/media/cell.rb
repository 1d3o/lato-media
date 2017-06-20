module LatoMedia

  class Inputs::Media::Cell < LatoCore::Cell

    view_paths << "#{LatoMedia::Engine.root}/app/cells"

    @@requested_args = [:name]

    @@default_args = {
      value: '',
      label: '',
      help: '',
      class: 'md-12',
      id: nil
    }

    def initialize(args = {})
      @args = validate_args(
        args: args,
        requested_args: @@requested_args,
        default_args: @@default_args
      )

      set_conditions
    end

    def show
      render 'show.html'
    end

    private

    def set_conditions
      # set show options
      @show_label = !@args[:label].nil? && !@args[:label].blank?
      @show_help = !@args[:help].nil? && !@args[:help].blank?
      # set correct id
      @id = @args[:id] ? @args[:id] : SecureRandom.hex(5) # generate random id if not custom id is set.
      # set current media
      media = get_media
      @media = media ? media : LatoMedia::Media.new
      # set current value
      @value = get_value
    end

    def get_media
      if @args[:value].is_a?(String)
        LatoMedia::Media.find_by(id: @args[:value].to_i)
      elsif @args[:value].is_a?(Integer)
        LatoMedia::Media.find_by(id: @args[:value])
      elsif @args[:value].class == LatoMedia::Media
        @args[:value]
      else
        raise 'Media value not accepted'
      end
    end

    def get_value
      @media.id if @media
    end

  end

end
