class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.comment_mail.subject
  #
  def comment_mail
    @feature = params[:feature]
    mail(to: @feature.mailId, subject: 'Comment added')
  end
end
