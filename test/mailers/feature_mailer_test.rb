require 'test_helper'

class FeatureMailerTest < ActionMailer::TestCase
    test "assign_feature" do
        mail = FeatureMailer.assign_feature
        assert_equal "Assign feature", mail.subject
        assert_equal ["to@example.org"], mail.to
        assert_equal ["from@example.com"], mail.from
        assert_match "Hi", mail.body.encoded
    end
end
