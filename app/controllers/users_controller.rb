class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  swagger_controller :users, 'Users'

  # GET /users or /users.json
  swagger_api :index do
    summary 'Returns all users'
  end
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  swagger_api :show do
    summary 'Returns one user'
    param :path, :id, :integer, :required, "User id"
  end

  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  # GET /students/1
  # GET /students/1.json
  
  # POST /users or /users.json
  swagger_api :create do
    summary 'Creates new user'
    param :form, "user[name]", :string, :required, "User name"
    param :form, "user[surname]", :string, :required, "User surname"
    param :form, "user[email]", :string, :required, "User email"
    param :form, "user[phone_number]", :string, :required, "User phone_number"
    param :form, "user[password]", :string, :required, "User password" 
  end
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  swagger_api :update do
    summary 'Updates user'
    param :path, :id, :integer, :required, "User id"
    param :form, "user[name]", :string, :required, "User name"
    param :form, "user[surname]", :string, :required, "User surname"
    param :form, "user[email]", :string, :required, "User email"
    param :form, "user[phonenumber]", :string, :required, "User phonenumber"
    param :form, "user[password]", :string, :required, "User password"
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  swagger_api :destroy do
    summary 'Destroys user'
    param :path, :id, :integer, :required, "User id"
  end
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :surname, :email, :phone_number, :password, :password_confirmation)
    end
end
