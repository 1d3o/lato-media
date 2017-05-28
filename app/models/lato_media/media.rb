module LatoMedia
  class Media < ActiveRecord::Base

    has_attached_file :attachment
    do_not_validate_attachment_file_type :attachment

  end
end
