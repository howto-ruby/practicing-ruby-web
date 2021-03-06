module Admin
  class ReportsController < ApplicationController
    before_filter :admin_only

    def index
      @statuses    = User.select("status, count(*) as user_count").group("status")
      @total_users = User.count
      @activity    = ActivityReport.call
      @activation  = ActivationReport.call
    end
  end
end
