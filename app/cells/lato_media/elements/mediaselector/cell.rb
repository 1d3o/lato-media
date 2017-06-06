module LatoMedia

  class Elements::Mediaselector::Cell < LatoCore::Cell

    view_paths << "#{LatoMedia::Engine.root}/app/cells"

    @@requested_args = [:id]

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

    def set_conditions; end

  end

end
