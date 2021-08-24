class PaymentDecorator < Draper::Decorator
  delegate_all

  def message
    I18n.t('api.message.payment', sender: sender_username,
                                  recipient: recipient_username,
                                  timestamp: formatted_date,
                                  description: description)
  end

  private

  def formatted_date
    created_at.strftime('%B %d, %Y')
  end
end
