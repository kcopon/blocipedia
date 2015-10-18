class WikiPolicy < ApplicationPolicy

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def index?
    true
  end

  def show? 
    record.public? || user.present?
  end
end