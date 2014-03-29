class CasesController < ApplicationController
  def index
    begin
      @filter = view_context.desk.filters.entries[0]
    rescue
      @filter = "error with filter"
    end
    begin
      @cases = @filter.cases
    rescue
      @cases = "error with cases"
    end
  end
end
