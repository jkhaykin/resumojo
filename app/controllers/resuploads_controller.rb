class ResuploadsController < ApplicationController
  before_action :set_resupload, only: [:show, :edit, :update, :destroy] 

  respond_to :html

  def index
    @resuploads = Resupload.all
    respond_with(@resuploads)
  end

  def show
  	@suggestions = Suggestion.where(:resupload_id => params[:id])
    respond_with(@resupload)
  end

  def new
    @resupload = Resupload.new
    respond_with(@resupload)
  end

  def edit
  end

  def create
    @resupload = Resupload.new(resupload_params)
    @resupload.user = current_user
    @resupload.save
    respond_with(@resupload) do |format|
    	format.html {redirect_to "/resumes/#{@resupload.id}" }
    end
  end

  def update
    @resupload.update(resupload_params)
    respond_with(@resupload)
  end

  def destroy
    @resupload.destroy
    respond_with(@resupload)
  end

  private
    def set_resupload
      @resupload = Resupload.find(params[:id])
    end

    def resupload_params
      params.require(:resupload).permit(:document, :user_id)
    end
end
