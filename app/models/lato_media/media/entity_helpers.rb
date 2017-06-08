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

    # This function tells if the attachment is a compressed file.
    def zip?
      attachment.content_type =~ /^zip/
    end

  end
end