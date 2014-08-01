class WelcomeController < ApplicationController
  def index
    @filters = view_context.desk.filters.entries
  end
end
