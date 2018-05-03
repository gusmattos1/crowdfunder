require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be unique" do
    user = create(:user, email: "bettymaker@gmail.com", password: "12345678", password_confirmation: "12345678")
    user2 = build(:user, email: "bettymaker@gmail.com", password: "00000000", password_confirmation: "00000000")
    refute user2.valid?
  end

  test "user must include password_confirmation on create" do
    user = build(:user, email: "bettymaker@gmail.com", password: "12345678")
    refute user.valid?
  end

  test "password must match confirmation" do
    user = build(:user, email: "bettymaker@gmail.com", password: "12345678", password_confirmation: "87654321")
    refute user.valid?
  end

  test "password must be at least 8 characters long" do
    user = build(:user, email: "bettymaker@gmail.com", password: "1234", password_confirmation: "1234")
    refute user.valid?
  end
end
