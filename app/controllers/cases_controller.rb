class CasesController < ApplicationController
  def index
    begin
      puts "filter position: " + params[:filter_id].to_s
      @filter = get_filter(params[:filter_id])
      @cases = get_cases(@filter)
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
      labels: @case.labels.entries.map(&:name)
    })
    @labels = get_labels
  end

  def update
    puts "filter index in update: " + params[:filter_id].to_s
    @case = get_a_case(params[:case][:id])
    @case_model = Case.new({
      the_case: @case,
      labels: params[:case].present? ? params[:case][:labels] : []
    })
    @labels = get_labels

    if @case_model.save
      redirect_to action: 'index', filter_id: params[:filter_id]
    else
      render action: 'edit', filter_id: params[:filter_id]
    end
  end

  private

  def get_desk
    ApplicationController.helpers.desk
  end

  def get_filter index = nil
    begin
      get_desk.filters.entries[(index.to_i-1)]
    rescue => e
      puts index.to_s
      puts e
      get_desk.filters.entries.first
    end
  end

  def get_cases filter = nil
    if filter.present?
      filter.cases
    else
      get_filter.cases
    end
  end

  def get_a_case id
    get_desk.cases.find(id)
  end

  def get_labels
    get_desk.labels.entries
  end
end
