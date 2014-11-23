require 'test_helper'

class AuthenticationControllerTest < ActionController::TestCase

  test "create valid user" do
    new_user = User.new name: "First", phone: "111-111-1111", zipcode: '11111', email: 'email@email.com',
                        password: "password", password_confirmation: "password"
    assert new_user.save
  end
  test "dont allow duplicate users" do
    new_user = User.new name: "First", phone: "111-111-1111", zipcode: '11111', email: 'email@email.com',
                        password: "password", password_confirmation: "password"
    new_user.save
    user = User.new name: "First", phone: "111-111-1111", zipcode: '11111', email: 'email@email.com',
                    password: "password", password_confirmation: "password"
    assert_not user.save
  end
  test "invalid user: passwords mismatch" do
    new_user = User.new name: "First", phone: "111-111-1111", zipcode: '11111', email: 'email@email.com',
                        password: "password", password_confirmation: "pasword"
    assert_not new_user.save
  end
  test "invalid user: invalid email" do
    new_user = User.new name: "First", phone: "111-111-1111", zipcode: '11111', email: 'email',
                        password: "password", password_confirmation: "pasword"
    assert_not new_user.save
  end
  test "login with invalid password" do
    post :authenticate, { session: { email: "jeni@gmail.com", password: "pass"} }
    assert_nil session[:user_id]
  end


  test "login works" do
    User.create name: "Jeni", phone: "111-111-1111", zipcode: '11111', email: 'jeni@gmail.com',
                        password: "foobar", password_confirmation: "foobar"
    
    post :authenticate, :session => { :email => "jeni@gmail.com", :password => "foobar" }
    assert_redirected_to controller: "home", action: 'home'
  end
end
