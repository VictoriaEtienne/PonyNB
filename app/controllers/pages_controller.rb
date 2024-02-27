class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @ponies = Pony.limit(10).order("created_at DESC");
  end

  def dashboard
    @user = current_user
  end
end
