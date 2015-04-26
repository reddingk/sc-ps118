class BrainyController < ApplicationController
  def index
    @device = Device.where("userid = ?", current_user.id)
    @sfile = Sfile.where("userid = ?", current_user.id)
  end

  def eugene
     @device = Device.where("userid = ?", current_user.id)
     
     if(params[:devid] == nil)
       if (@device.size == 0)
         @pageid = 0
       else
        @pageid = @device.first.id 
       end
     else
       @pageid = params[:devid]
     end
     
     @sfile = Sfile.where("userid = ? and devid = ?", current_user.id, @pageid)
     @sfile_u = Sfile.new
  end
  
  def download
    #send_file Rails.root.join('private', 'uploads','sfile','syncfile',params[:userid],params[:fname]), :x_sendfile=>true
    #send_file "#{Rails.root}#{params[:fname]}", :x_sendfile=>true
    send_file "#{params[:fname]}", :x_sendfile=>true
  end
  
  def view
    #send_file "#{Rails.root}#{params[:fname]}", :disposition => 'inline'
    send_file "#{params[:fname]}", :disposition => 'inline'
  end
  
  private 
    def sfile_params
      params.require(:sfile).permit(:name, :syncfile, :devid, :userid)
    end
end
