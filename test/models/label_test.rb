require 'test_helper'

class LabelTest < ActionController::TestCase
  test "saving a blank label doesn't work" do
    before_count = ApplicationController.helpers.desk.labels.entries.length
    label = Label.new
    saved = label.save
    assert !saved, "empty label was saved!"
    assert label.errors.full_messages.any?, "empty label has no errors"
    after_count = ApplicationController.helpers.desk.labels.entries.length
    assert_equal before_count, after_count
  end

  test "saving a good label should work" do
    before_count = ApplicationController.helpers.desk.labels.entries.length
    label = Label.new({name: "something new", enabled: true, types: "case", color: "orange"})
    saved = label.save
    assert saved, "proper label was not saved because of " + label.errors.full_messages.join(", ")
    assert label.errors.empty?, label.errors.full_messages.join(", ")
    after_count = ApplicationController.helpers.desk.labels.entries.length
    assert_not_equal before_count, after_count
  end
end