require 'test_helper'

class CinemaMoviesControllerTest < ActionController::TestCase
  setup do
    @cinema_movie = cinema_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cinema_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cinema_movie" do
    assert_difference('CinemaMovie.count') do
      post :create, cinema_movie: { cinema_id: @cinema_movie.cinema_id, movie_id: @cinema_movie.movie_id }
    end

    assert_redirected_to cinema_movie_path(assigns(:cinema_movie))
  end

  test "should show cinema_movie" do
    get :show, id: @cinema_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cinema_movie
    assert_response :success
  end

  test "should update cinema_movie" do
    patch :update, id: @cinema_movie, cinema_movie: { cinema_id: @cinema_movie.cinema_id, movie_id: @cinema_movie.movie_id }
    assert_redirected_to cinema_movie_path(assigns(:cinema_movie))
  end

  test "should destroy cinema_movie" do
    assert_difference('CinemaMovie.count', -1) do
      delete :destroy, id: @cinema_movie
    end

    assert_redirected_to cinema_movies_path
  end
end
