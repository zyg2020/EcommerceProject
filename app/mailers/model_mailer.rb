class ModelMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_customer_notification.subject
  #
  def new_customer_notification(record)
    @greeting = "Hi"

    @customer = record
    mail to: "zhuyange2018@yahoo.com", subject: "New customer registered"
  end
end
