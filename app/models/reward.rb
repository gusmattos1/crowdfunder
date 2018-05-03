class Reward < ActiveRecord::Base
  belongs_to :project

validates :dollar_amount, :description, presence: true
validate :reward_dollar_amount_must_be_a_positive_number


  def reward_dollar_amount_must_be_a_positive_number
    if dollar_amount && dollar_amount <= 0
      errors.add(:dollar_amount, "Reward amount must be greater than $0")
    end

  end


end
