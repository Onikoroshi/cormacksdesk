class LabelsController < ApplicationController
  def index
    @labels = view_context.desk.labels.entries
  end

  def new
    @errors ||= nil
  end

  def create
    begin
      new_label = view_context.desk.labels.create({
        name: params[:label][:name],
        description: params[:label][:description],
        types: params[:label][:types],
        enabled: params[:label][:enabled],
        color: params[:label][:color]
      })
    rescue DeskApi::Error => e
      @errors = e.message
      e.errors.each do |an_error|
        @errors += "<br>" + an_error[0] + " : " + an_error[1].to_s
      end
      redirect_to action: 'new'
      return
    end

    redirect_to action: 'index'
  end
end
