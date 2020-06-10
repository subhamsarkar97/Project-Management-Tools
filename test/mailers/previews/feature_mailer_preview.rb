# Preview all emails at http://localhost:3000/rails/mailers/feature_mailer
class FeatureMailerPreview < ActionMailer::Preview

    # Preview this email at http://localhost:3000/rails/mailers/feature_mailer/assign_feature
    def assign_feature
        FeatureMailer.assign_feature
    end

end
