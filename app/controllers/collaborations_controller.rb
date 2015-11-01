class CollaborationsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    # grab wiki (nest it in routes.rb in wikis)
    
    user = User.where(email: params[:email]).first
    # grab the email being sent in and query the users table - find email through user
    if user && !@wiki.users.include?(user) && Collaboration.create(user: user, wiki: @wiki)
      flash[:notice] = "Collaborator added"
    elsif @wiki.users.include?(user)
      flash[:notice] = "#{user.email} is already a collaborator"
    elsif user.nil?
      flash[:notice] = "Unable to add collaborator"
    else
      flash[:error] = "Error. Something went wrong"
    end
    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    # grab wiki
    @wiki = Wiki.find(params[:wiki_id])
    collaboration = Collaboration.find(params[:id])
    # grab collaboration
    #if wiki is destroy successfully, flash
    if collaboration.destroy
      flash[:notice] = "Collaborator destroyed"
    #else flash error
    else 
      flash[:notice] = "Unable to destroy collaborator"
    #redirect
    end
    redirect_to edit_wiki_path(@wiki)
  end
end
