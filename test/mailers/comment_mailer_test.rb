require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
    test "comment_mail" do
        mail = CommentMailer.comment_mail
        assert_equal "Comment mail", mail.subject
        assert_equal ["to@example.org"], mail.to
        assert_equal ["from@example.com"], mail.from
        assert_match "Hi", mail.body.encoded
    end
end
