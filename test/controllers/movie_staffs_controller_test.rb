require 'test_helper'

class MovieStaffsControllerTest < ActionController::TestCase
  setup do
    @movie_staff = movie_staffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_staffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_staff" do
    assert_difference('MovieStaff.count') do
      post :create, movie_staff: { movie_id: @movie_staff.movie_id, role: @movie_staff.role, staff_id: @movie_staff.staff_id }
    end

    assert_redirected_to movie_staff_path(assigns(:movie_staff))
  end

  test "should show movie_staff" do
    get :show, id: @movie_staff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_staff
    assert_response :success
  end

  test "should update movie_staff" do
    patch :update, id: @movie_staff, movie_staff: { movie_id: @movie_staff.movie_id, role: @movie_staff.role, staff_id: @movie_staff.staff_id }
    assert_redirected_to movie_staff_path(assigns(:movie_staff))
  end

  test "should destroy movie_staff" do
    assert_difference('MovieStaff.count', -1) do
      delete :destroy, id: @movie_staff
    end

    assert_redirected_to movie_staffs_path
  end
end
