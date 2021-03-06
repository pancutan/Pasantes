require 'test_helper'

class InternshipsControllerTest < ActionController::TestCase
  setup do
    @internship = internships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internship" do
    assert_difference('Internship.count') do
      post :create, internship: { company_id: @internship.company_id, date_from: @internship.date_from, date_until: @internship.date_until, description_job: @internship.description_job, hs_friday: @internship.hs_friday, hs_monday: @internship.hs_monday, hs_saturday: @internship.hs_saturday, hs_sunday: @internship.hs_sunday, hs_thursday: @internship.hs_thursday, hs_tuesday: @internship.hs_tuesday, hs_wednesday: @internship.hs_wednesday, situation_id: @internship.situation_id }
    end

    assert_redirected_to internship_path(assigns(:internship))
  end

  test "should show internship" do
    get :show, id: @internship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internship
    assert_response :success
  end

  test "should update internship" do
    put :update, id: @internship, internship: { company_id: @internship.company_id, date_from: @internship.date_from, date_until: @internship.date_until, description_job: @internship.description_job, hs_friday: @internship.hs_friday, hs_monday: @internship.hs_monday, hs_saturday: @internship.hs_saturday, hs_sunday: @internship.hs_sunday, hs_thursday: @internship.hs_thursday, hs_tuesday: @internship.hs_tuesday, hs_wednesday: @internship.hs_wednesday, situation_id: @internship.situation_id }
    assert_redirected_to internship_path(assigns(:internship))
  end

  test "should destroy internship" do
    assert_difference('Internship.count', -1) do
      delete :destroy, id: @internship
    end

    assert_redirected_to internships_path
  end
end
