class GeraldController < ApplicationController
  def index
  end

  def arnold
    @device = Device.where("userid = ?", current_user.id)
  end

  def sid
  end
  
  def _per_home
    
  end
end
