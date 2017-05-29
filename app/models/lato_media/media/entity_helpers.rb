module LatoMedia
  module Media::EntityHelpers

    # This function tells if the attachment is an image or another
    # type of file.
    def image?
      attachment.content_type =~ /^image/
    end

  end
end