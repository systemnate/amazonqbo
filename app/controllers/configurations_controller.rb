class ConfigurationsController < ApplicationController
  before_action :check_user

  def new
    @user = current_user
    @configuration = @user.build_configuration
  end

  def create
    @user = current_user
    @configuration = @user.build_configuration(configurations_params)
    if @configuration.save
      flash[:success] = "Configuration was successfully created."
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @configuration = current_user.configuration
  end

  private
  
  def configurations_params
    params.require(:configuration).permit(:primary_marketplace_id, :merchant_id, :auth_token)
  end
end
