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
      medias = get_medias
      @medias = medias ? medias : []
      # set current value
      @value = get_value
    end

    def get_medias
      if @args[:value].is_a?(String)
        array = @args[:value].split(',')
        get_medias_from_array(array)
      elsif @args[:value].is_a?(Array)
        get_medias_from_array(@args[:value])
      else
        raise 'Gallery value not accepted'
      end
    end

    def get_medias_from_array(array)
      medias = []
      array.each do |element|
        if element.is_a?(String)
          medias.push(LatoMedia::Media.find_by(id: element.to_i))
        elsif element.is_a?(Integer)
          medias.push(LatoMedia::Media.find_by(id: element))
        elsif element.class == LatoMedia::Media
          medias.push(element)
        else
          raise 'Media value not accepted'
        end
      end
      medias
    end

    def get_value
      values = @medias.map { |m| m.id if m }
      values.join(',')
    end

  end

end