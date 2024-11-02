# frozen_string_literal: true

class CvController < ApplicationController
  before_action :authenticate_user!, except: %i[home show]
  def home
  end

  def new
    redirect_to edit_cv_path(id: current_user.cv.id) if current_user.cv
    @cv = Cv.new
    @cv.content = File.read(Rails.root.join("app/templates/cv_template.md"))
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

  def edit_your_cv
    @cv = current_user.cv
    if @cv
      redirect_to edit_cv_path(@cv)
    else
      redirect_to new_cv_path
    end
  end
  def edit
    @cv = Cv.find(params[:id])
    authorize! @cv
  end

  def update
    @cv = Cv.find(params[:id])
    authorize! @cv
    if @cv.update(cv_params)
      redirect_to edit_cv_path(id: @cv.id), notice: 'CV was successfully updated.'
    else
      redirect_to edit_cv_path(id: @cv.id), alert: 'CV was not updated.'
    end
  end

  private

  def cv_params
    params.require(:cv).permit(:content)
  end
end
