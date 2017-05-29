module LatoMedia
  class Media < ActiveRecord::Base

    IMAGES_SIZES = {
      large: "#{CONFIGS[:lato_media][:large_media_width]}x#{CONFIGS[:lato_media][:large_media_width]}>",
      medium: "#{CONFIGS[:lato_media][:medium_media_width]}x#{CONFIGS[:lato_media][:medium_media_width]}>",
      thumb: "#{CONFIGS[:lato_media][:thumb_media_width]}x#{CONFIGS[:lato_media][:thumb_media_width]}>"
    }

    # Dependencies:

    include Media::EntityHelpers

    # Other settings:

    has_attached_file :attachment, styles: lambda { |a| a.content_type =~ /^image/ ? IMAGES_SIZES : {} }
    do_not_validate_attachment_file_type :attachment

    # Callbacks:

    before_save do
      self.title = attachment_file_name unless title
    end

  end
end
