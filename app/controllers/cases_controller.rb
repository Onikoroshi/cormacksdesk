class CasesController < ApplicationController
  def index
    begin
      @filter = get_filter
      @cases = get_cases
    rescue DeskApi::Error => e
      @errors= {e.to_s => e.backtrace.inspect}
      # raise e
    end
  end

  def edit
    @case = get_a_case(params[:id])
    @case_model = Case.new({
      the_case: @case,
      labels: []
    })
    @labels = get_labels
  end

  def update
    @case = get_a_case(params[:id])
    @case_model = Case.new({
      the_case: @case,
      labels: params[:case] ? params[:case][:labels] : []
    })
    @labels = get_labels

    if @case_model.save
      redirect_to action: 'index'
    else
      render action: 'edit'
    end
  end

  private
  def get_filter
    ApplicationController.helpers.desk.filters.entries.first
  end

  def get_cases
    get_filter.cases
  end

  def get_a_case id = 3
    ApplicationController.helpers.desk.filters.entries.first.cases.entries[1]
  end

  def get_labels
    ApplicationController.helpers.desk.labels.entries
  end
end
