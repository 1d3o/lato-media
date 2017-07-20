module LatoMedia
  class Back::BackController < ApplicationController

    # Specific helpers import to fix not found functions bug
    helper LatoMedia::ApplicationHelper

    layout 'lato_core/admin'

    before_action :core__cells_initialize
    before_action :core__manage_superuser_session

  end
end
