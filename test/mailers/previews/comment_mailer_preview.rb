# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

    # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/comment_mail
    def comment_mail
        comment = Comment.last
        CommentMailer.comment_mail(comment)
    end

end
