require 'test_helper'

class ChefsLoginTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com", password: "password")
  end
  test 'invalid login is rejected' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: " ", password: " "}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    # test if not logged in, should show `log in` link, and no `log out` link
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    get root_path
    assert flash.empty?
  end
  
  test 'valid login credentials accepted and begin session' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @chef.email, password: @chef.password }}
    assert_redirected_to @chef
    follow_redirect!
    assert_template 'chefs/show'
    assert_not flash.empty?
    # test if logged in, should show `log out`, `View` and `Edit` profile links, and no `log in` link
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", chef_path(@chef)
    assert_select "a[href=?]", edit_chef_path(@chef)
  end

  
end
