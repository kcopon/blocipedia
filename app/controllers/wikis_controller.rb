class WikisController < ApplicationController
  #before_filter :check_premium_logged_in!, :except => 

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    #authorize @wiki
  end

  def new
    @wiki = Wiki.new
    #authorize @wiki
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))
    @wiki.user = current_user
    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving this Wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    #authorize @wiki
  end

  def update 
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :private))
      flash[:notice] = "Update successful!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error in saving the update. Please try again"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    #authorize @wiki
    if @wiki.destroy
      flash[:notice] = "Entry was deleted successfully"
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting this wiki"
      render :show
    end 
  end

  def check_premium_acct
    authenticate_premium!
  end

end
