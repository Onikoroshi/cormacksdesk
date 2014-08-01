module WelcomeHelper
  def count_filter_cases(filter)
    filter.cases.entries.count.to_s
  end
end
