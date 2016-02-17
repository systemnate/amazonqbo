class ConfigurationsController < ApplicationController
  before_action :check_user
  before_action :set_user, only: [:new, :create, :edit, :update, :show]

  def new
    @configuration = @user.build_configuration
  end

  def create
    create_update_configuration("Configuration was successfully created.", :new)
  end

  def edit
    @configuration = @user.configuration
  end

  def update
    create_update_configuration("Configuration was successfully updated.", :edit)
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

  def create_update_configuration(flash_message, action)
    @configuration = @user.build_configuration(configuration_params)
    if @configuration.save
      flash[:success] = flash_message
      redirect_to [@user, @configuration]
    else
      render action
    end
  end
end
