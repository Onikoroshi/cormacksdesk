class CasesController < ApplicationController
  def index
    begin
      @filter = ApplicationController.helpers.desk.filters.entries[0]
      @cases = @filter.cases
    rescue DesApi::Error => e
      @errors = e.to_s
    end
  end

  def edit
    @case = get_cases.entries.find(params[:id]).first
    @case_model = Case.new({
      the_case: @case,
      labels: []
    })
    @labels = ApplicationController.helpers.desk.labels.entries
  end

  def update
    @case = get_cases.entries.find(params[:id]).first
    @case_model = Case.new({
      the_case: @case,
      labels: params[:case] ? params[:case][:labels] : []
    })
    @labels = ApplicationController.helpers.desk.labels.entries

    if @case_model.save
      redirect_to action: 'index'
    else
      render action: 'edit'
    end
  end

  private
  def get_filter
    ApplicationController.helpers.desk.filters.entries[0]
  end

  def get_cases
    get_filter.cases
  end
end
