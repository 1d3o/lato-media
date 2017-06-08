module LatoMedia

  class Inputs::Media::Cell < LatoCore::Cell

    view_paths << "#{LatoMedia::Engine.root}/app/cells"

    @@requested_args = [:name]

    @@default_args = {
      value: '',
      label: '',
      help: '',
      class: 'md-12',
      per_page: 12,
      size: 'medium',
      height: 200
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
      # find requested media
      @media = ((@args[:value] && !@args[:value].blank?) ? LatoMedia::Media.find_by(id: @args[:value]) : LatoMedia::Media.new)
      @medias = LatoMedia::Media.all.reverse.first(@args[:per_page])
      @pagination_total = (LatoMedia::Media.all.length / @args[:per_page].to_f).ceil
    end

  end

end
