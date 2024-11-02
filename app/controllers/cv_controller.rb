class CvController < ApplicationController
  before_action :authenticate_user!, except: %i[home show]
  def home
  end

  def new
    redirect_to edit_cv_path(id: current_user.cv.id) if current_user.cv
    @cv = Cv.new
  end

  def create
    @cv = Cv.new(cv_params)
    @cv.user_id = current_user.id

    if @cv.save
      redirect_to edit_cv_path(id: @cv.id), notice: 'CV was successfully created.'
    else
      render :new
    end
  end

  def edit
    @cv = Cv.find(params[:id])
  end

  def show

  end

  private

  def cv_params
    params.require(:cv).permit(:content)
  end
end
