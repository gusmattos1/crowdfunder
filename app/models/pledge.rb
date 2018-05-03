class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true


  validate :user_should_not_be_the_owner

  def user_should_not_be_the_owner

    if self.user == project.user

      errors.add(:user, "Owner should not be able to pledge towards own project")
    end
end
