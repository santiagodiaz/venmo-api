class MoreThanLimitAmountError < StandardError
  def initialize
    super(I18n.t('api.errors.more_than_limit_amount'))
  end
end
