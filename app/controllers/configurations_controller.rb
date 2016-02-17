class ConfigurationsController < ApplicationController
  before_action :check_user
  before_action :set_user, only: [:new, :create, :edit, :update, :show]

  def new
    @configuration = @user.build_configuration
  end

  def create
    @configuration = @user.build_configuration(configuration_params)
    if @configuration.save
      flash[:success] = "Configuration was successfully created."
      redirect_to [@user, @configuration]
    else
      render :new
    end
  end

  def edit
    @configuration = @user.configuration
  end

  def update
    @configuration = @user.build_configuration(configuration_params)
    if @configuration.save
      flash[:success] = "Configuration was successfully updated."
      redirect_to [@user, @configuration]
    else
      render :edit
    end
  end

  def show
    @configuration = current_user.configuration
  end

  private
  
  def configuration_params
    params.require(:configuration).permit(:primary_marketplace_id, :merchant_id, :auth_token)
  end

  def set_user
    @user = current_user
  end
end
