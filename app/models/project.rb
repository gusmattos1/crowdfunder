class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner


  validates :user,:title, :description, :goal, :start_date, :end_date, presence: true
  validate :project_start_date_in_future
  validate :project_start_date_must_be_greater_than_end_date
  validate :project_goal_must_be_a_positive_number


  def project_start_date_in_future
    t = Date.today
    #user_date = t.strftime
    if start_date <= t
      errors.add(:start_date, "Project start date must be in the future")
    end
  end

  def project_start_date_must_be_greater_than_end_date
    if start_date >= end_date
      errors.add(:start_date, "Project start date must be greater than end date")
    end
  end

  def project_goal_must_be_a_positive_number
    if goal < 0
      errors.add(:goal, "Project goal must be greater than $0")
    end
  end




end
