module LatoMedia
  class Media < ActiveRecord::Base

    # Other settings:

    has_attached_file :attachment
    do_not_validate_attachment_file_type :attachment

    # Callbacks:

    before_save do
      self.title = attachment_file_name unless title
    end

  end
end
