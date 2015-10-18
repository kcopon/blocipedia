class WikiPolicy < ApplicationPolicy

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def show? 
    record.public? || user.present?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user, @scope = user, scope
    end

    def resolve
      wikis = []

      if user.admin?
        wikis = scope.all
      elsif user.present?
        scope.all.each do |wiki|
          if !wiki.private || wiki.user == user# || wiki.users.include?(user)
            wikis << wiki
          end
        end
      else
        wikis = scope.none
      end 
      wikis  
    end
  end
end