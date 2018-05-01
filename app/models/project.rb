class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner

  validates :user,:title, :description, :goal, :start_date, :end_date, presence: true
  validate :project_start_date_in_future

  def project_start_date_in_future
    t = Time.now
    #user_date = t.strftime
    if start_date <= t
      errors.add(:start_date, "Project start date must be in the future")
    end
  end
end
