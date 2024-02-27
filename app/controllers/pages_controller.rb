class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @ponies = Pony.all
    @ponies = Pony.new
  end

  def dashboard
    @user = current_user
  end

end
