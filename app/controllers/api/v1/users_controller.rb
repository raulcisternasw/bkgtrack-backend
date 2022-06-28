class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET api/v1/users or api/v1/users.json
  def index
    @users = User.all
    render json: @users
  end

  # GET api/v1/users/1 or api/v1/users/1.json
  def show
    render json: @user
  end

  # POST api/v1/users or api/v1/users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user.as_json(root: true, except: [:created_at, :updated_at]), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/users/1 or api/v1/users/1.json
  def update
    if @user.update(user_params)
      render json: @user.as_json(root: true, except: [:created_at, :updated_at]), status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/users/1 or api/v1/users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :email,
        :first_name,
        :last_name,
        :username,
        :gender,
        :date_of_birth,
        :phone
      )
    end
end
