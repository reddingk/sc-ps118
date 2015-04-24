class SfilesController < ApplicationController
  def new
    @sfiles = Sfile.new
  end

  def create
    @sfile = Sfile.new(sfile_params)
    if @sfile.save
      
      ##Device.find(@sfile.devid).update(updated_at: Time.now)
      redirect_to '/brainy/eugene'
      flash[:success] = "The file #{@sfile.name} has been uploaded."
    else
    end
  end

  def destroy
    @sfile = Sfile.find(params[:id])
    @sfile.destroy
    redirect_to '/brainy/eugene'
    flash[:success] = "The file #{@sfile.name} has been deleted."
  end
  
  private 
    def sfile_params
      params.require(:sfile).permit(:name, :syncfile, :devid, :userid)
    end
end
