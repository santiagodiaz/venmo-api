class NegativeOrZeroAmountError < StandardError
  def initialize
    super(I18n.t('api.errors.negative_or_zero_amount'))
  end
end
