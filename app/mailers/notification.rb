class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order_confirmation.subject
  #
  def order_confirmation(order)
    @order = order

    mail to: "#{order.user.email}", subject: "your order has been confirmed - #{order.order_number}", cc:"ramya20lu@gmail.com"
  end
end
