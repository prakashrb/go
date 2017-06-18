class Api::V1::UsersController < ApplicationController
  before_action :check_token
  respond_to :xml
  def index
  	@users = User.all
  	render xml: @users.collect(&:to_xml)
  end

  def check_token
    user = User.where(token: params[:token]).first

    unless user
      render json: { message: 'Not Authorized' }, status: :unauthorized
    end

  end
end
