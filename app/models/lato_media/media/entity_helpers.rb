module LatoMedia
  module Media::EntityHelpers

    # This function tells if the attachment exists.
    def exists?
      attachment.exists?
    end

    # This function tells if the attachment is an image.
    def image?
      attachment.content_type =~ /^image/
    end

  end
end