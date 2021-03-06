class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # TODO: no signup for users, only admins can create users
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to root_url, notice: "Signed up!"
    # else
    #   render "new"
    # end
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
