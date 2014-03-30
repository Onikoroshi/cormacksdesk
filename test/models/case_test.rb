require 'test_helper'

class LabelTest < ActionController::TestCase
  test "updating with non-string labels doesn't work" do
    labels = ApplicationController.helpers.desk.labels.entries[0..3]
    the_case_object = ApplicationController.helpers.desk.filters.entries[0].cases.entries.find(1).first
    before_labels = the_case_object.labels.entries
    a_case = Case.new({the_case: the_case_object, labels: labels})
    saved = a_case.save
    assert !saved, "bad labels were updated!"
    assert label.errors.full_messages.any?, "empty label has no errors"
    after_labels = the_case_object.labels.entries
    assert_equal before_labels, after_labels
  end

  # test "saving a good label should work" do
  #   before_count = ApplicationController.helpers.desk.labels.entries.length
  #   label = Label.new({name: "something new", enabled: true, types: "case", color: "orange"})
  #   saved = label.save
  #   assert saved, "proper label was not saved because of " + label.errors.full_messages.join(", ")
  #   assert label.errors.empty?, label.errors.full_messages.join(", ")
  #   after_count = ApplicationController.helpers.desk.labels.entries.length
  #   assert_not_equal before_count, after_count
  # end
end