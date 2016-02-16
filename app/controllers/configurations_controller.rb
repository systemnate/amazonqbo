class ConfigurationsController < ApplicationController
  def new
    @user = current_user
    @configuration = @user.configurations.new
  end

  def create
    @user = current_user
    @configuration = @user.configurations.new(configurations_params)
    if @configuration.save
      flash[:success] = "Configuration was successfully created."
      redirect_to @user
    else
      render :new
    end
  end

  private
  
  def configurations_params
    params.require(:configuration).permit(:primary_marketplace_id, :merchant_id, :auth_token)
  end
end
