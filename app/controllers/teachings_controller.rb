class TeachingsController < ApplicationController
  def index
    @teachings = Teaching.all
  end

  def show
  end

  def new
    @teaching = Teaching.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end


end
