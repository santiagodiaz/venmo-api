class NotFriendsError < StandardError
  def initialize
    super(I18n.t('api.errors.not_friends'))
  end
end
