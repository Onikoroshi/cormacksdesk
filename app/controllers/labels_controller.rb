class LabelsController < ApplicationController
  def index
    @labels = view_context.desk.labels.entries
  end

  def new
    @label = Label.new()
  end

  def create
    @label = Label.new(params[:label])
    # ({
    #   name: params[:label][:name],
    #   description: params[:label][:description],
    #   types: params[:label][:types],
    #   enabled: params[:label][:enabled],
    #   color: params[:label][:color]
    # })

    if @label.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end
end
