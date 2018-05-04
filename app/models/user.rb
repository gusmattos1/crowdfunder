class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  has_many :pledges

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true

  def total_pledged
    self.pledges.sum(:dollar_amount)
  end

  def projects_backed
    projects=[]
    self.pledges.each do |pledge|
      proj =  Project.find(pledge.project_id)
      unless projects.include?(proj)
        projects.push proj
      end
    end
    return projects
  end
end
