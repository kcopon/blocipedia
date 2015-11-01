class Wiki < ActiveRecord::Base
  has_many :collaborations
  has_many :users, through: :collaborations
  belongs_to :user

  scope :visible_to, -> (user) { user ? all : where(public: true) }
  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }

  def public?
    private == false
  end
end
