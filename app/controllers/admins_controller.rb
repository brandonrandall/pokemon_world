class AdminsController < ApplicationController
  def new
    @admin = User.new
  end

  def show
    @amin = User.find(params[:id])
  end

  def create
    binding.pry
    @admin = User.new(admin_params)
    if @admin.save
      redirect_to admins_path
    else
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name,
                                  :username,
                                  :password,
                                  :password_confirmation
                                 )
  end
end
