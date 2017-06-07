module LatoMedia

  class Elements::Preview::Cell < LatoCore::Cell

    view_paths << "#{LatoMedia::Engine.root}/app/cells"

    @@requested_args = [:media]

    @@default_args = {}

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
      @is_empty = !@args[:media].exists?
      # info for existing media
      @is_image = @args[:media].image?
    end

  end

end
