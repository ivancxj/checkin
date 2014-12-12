# coding: utf-8
class Admin::HomeController < ApplicationController
  def index
    # History.today
    @users_today = User.includes(:histories_today).where(enabled: true).all
    @users_yesterday = User.includes(:histories_yesterday).where(enabled: true).all




  end
end
