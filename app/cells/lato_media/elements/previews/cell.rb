module LatoMedia

  class Elements::Previews::Cell < LatoCore::Cell

    view_paths << "#{LatoMedia::Engine.root}/app/cells"

    @@requested_args = [:medias]

    @@default_args = {
      class: '',
      size: 'large',
      url: nil,
      remote: false,
      onclick: ''
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

    def set_conditions; end

  end

end
