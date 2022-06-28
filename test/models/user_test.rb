require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?, 'saved user without a email'
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end

  test 'invalid without first name' do
    @user.first_name = nil
    refute @user.valid?, 'saved user without a first name'
    assert_not_nil @user.errors[:first_name], 'no validation error for first name present'
  end

  test 'invalid without last name' do
    @user.last_name = nil
    refute @user.valid?, 'saved user without a last name'
    assert_not_nil @user.errors[:last_name], 'no validation error for last name present'
  end

  test 'invalid without gender' do
    @user.gender = nil
    refute @user.valid?, 'saved user without a gender'
    assert_not_nil @user.errors[:gender], 'no validation error for gender present'
  end
end
