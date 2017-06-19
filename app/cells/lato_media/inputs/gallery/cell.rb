module LatoMedia

  class Inputs::Gallery::Cell < LatoCore::Cell

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
      medias = LatoMedia::Media.where(id: @args[:value])
      @medias = medias ? medias : []
    end

  end

end