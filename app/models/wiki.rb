class Wiki < ActiveRecord::Base
  belongs_to :user

  #scope :visible_to, -> (user) { user ? all : where (public: true) }
  #scope :publicly_viewable, -> { where(public: true) }
  #scope :privately_viewable, -> { where(public: false) }

end
