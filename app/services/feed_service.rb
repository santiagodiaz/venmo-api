class FeedService
  attr_reader :user, :page_number

  def initialize(user, page_number)
    @user = user
    @page_number = page_number
  end

  def feed_activities
    users_ids = find_friends_second_degree(user)
    result = find_payments(users_ids).page(page_number).per_page(10)
    [result.total_pages, result]
  end

  private

  def find_friends_second_degree(user)
    FriendshipService.new(user).find_friends_second_degree
  end

  def find_payments(users_ids)
    Payment.where(sender: users_ids)
           .or(Payment.where(recipient: users_ids))
           .order(created_at: :desc)
  end
end
