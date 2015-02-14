class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: :create


  respond_to :html

  def index
    @suggestions = Suggestion.all
    respond_with(@suggestions)
  end

  def show
    respond_with(@suggestion)
  end

  def new
    @suggestion = Suggestion.new
    respond_with(@suggestion)
  end

  def edit
  end

  def create
  	@resupload = Resupload.find(params[:resupload_id])
    @suggestion = @resupload.suggestions.build(suggestion_params)
    @suggestion.user = current_user
    @suggestion.save
    respond_with(@suggestion) do |format|
    	format.html {redirect_to "/resumes/#{@resupload.id}/#{@resupload.document_file_name}" }
    end
  end

  def update
    @suggestion.update(suggestion_params)
    respond_with(@suggestion)
  end

  def destroy
    @suggestion.destroy
    respond_with(@suggestion)
  end

  private
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    def suggestion_params
      params.require(:suggestion).permit(:comment, :xcoord, :ycoord, :user_id, :resupload_id)
    end
end
