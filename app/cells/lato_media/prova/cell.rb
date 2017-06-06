module LatoMedia

  class Prova::Cell < LatoCore::Cell

    view_paths << "#{LatoMedia::Engine.root}/app/cells"

    def initialize(args = {})

    end

    def show
      render 'show.html'
    end

  end

end
