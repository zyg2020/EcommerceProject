# Preview all emails at http://localhost:3000/rails/mailers/model_mailer
class ModelMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/model_mailer/new_customer_notification
  def new_customer_notification
    ModelMailer.new_customer_notification
  end

end
