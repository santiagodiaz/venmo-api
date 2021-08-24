class PaymentDecorator < Draper::Decorator
  delegate_all

  def title_and_description
    I18n.t('api.message.payment', sender: sender_username,
                                  recipient: recipient_username,
                                  timestamp: created_at,
                                  description: description)
  end
end
