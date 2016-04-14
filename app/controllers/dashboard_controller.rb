class DashboardController < ApplicationController
 def index
  @identities = Identity.all.order('created_at DESC')
 end
end
