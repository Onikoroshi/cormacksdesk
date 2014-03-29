class WelcomeController < ApplicationController
  def index
    @cases = view_context.desk.cases
    @labels = view_context.desk.labels
  end
end
