require 'test_helper'

class ProjectInvitationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_invitations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_invitation" do
    assert_difference('ProjectInvitation.count') do
      post :create, :project_invitation => { }
    end

    assert_redirected_to project_invitation_path(assigns(:project_invitation))
  end

  test "should show project_invitation" do
    get :show, :id => project_invitations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => project_invitations(:one).to_param
    assert_response :success
  end

  test "should update project_invitation" do
    put :update, :id => project_invitations(:one).to_param, :project_invitation => { }
    assert_redirected_to project_invitation_path(assigns(:project_invitation))
  end

  test "should destroy project_invitation" do
    assert_difference('ProjectInvitation.count', -1) do
      delete :destroy, :id => project_invitations(:one).to_param
    end

    assert_redirected_to project_invitations_path
  end
end
