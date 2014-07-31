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
    if @case.locked_until.present?
      puts "this case is locked!"
    end
    @case_model = Case.new({
      the_case: @case,
      labels: []
    })
    @labels = get_labels
  end

  def update
    @case = get_a_case(params[:case][:id])
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
  def get_desk
    ApplicationController.helpers.desk
  end

  def get_filter
    get_desk.filters.entries.first
  end

  def get_cases
    get_filter.cases
  end

  def get_a_case id
    get_desk.cases.find(id)
  end

  def get_labels
    get_desk.labels.entries
  end
end
