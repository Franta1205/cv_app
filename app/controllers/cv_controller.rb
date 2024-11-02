class CvController < ApplicationController
  before_action :authenticate_user!, only: %i[home new create show]
  def home
  end

  def new
  end

  def create
  end

  def edit

  end

  def show

  end
end
