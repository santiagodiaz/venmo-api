# Users
user1 = User.create!(username: 'santidiaz')
user2 = User.create!(username: 'martinpalermo')
user3 = User.create!(username: 'romanriquelme')
user4 = User.create!(username: 'leomessi')
user5 = User.create!(username: 'kunaguero')
user6 = User.create!(username: 'dimaria')
user7 = User.create!(username: 'leoparedes')
user8 = User.create!(username: 'depaul')
user9 = User.create!(username: 'carlosbianchi')
user10 = User.create!(username: 'diegomaradona')
user11 = User.create!(username: 'manuginobili')
user12 = User.create!(username: 'mjordan')

# Friendships
Friendship.create!(friend_a_id: user1.id, friend_b_id: user2.id)
Friendship.create!(friend_a_id: user2.id, friend_b_id: user3.id)
Friendship.create!(friend_a_id: user2.id, friend_b_id: user4.id)
Friendship.create!(friend_a_id: user4.id, friend_b_id: user7.id)
Friendship.create!(friend_a_id: user4.id, friend_b_id: user5.id)
Friendship.create!(friend_a_id: user4.id, friend_b_id: user10.id)
Friendship.create!(friend_a_id: user3.id, friend_b_id: user9.id)
Friendship.create!(friend_a_id: user5.id, friend_b_id: user6.id)
Friendship.create!(friend_a_id: user6.id, friend_b_id: user8.id)
Friendship.create!(friend_a_id: user8.id, friend_b_id: user4.id)
Friendship.create!(friend_a_id: user11.id, friend_b_id: user12.id)

# PaymentAccounts
PaymentAccount.create!(balance: 7000, user_id: user1.id)
PaymentAccount.create!(balance: 7000, user_id: user2.id)
PaymentAccount.create!(balance: 20, user_id: user3.id)
PaymentAccount.create!(balance: 20, user_id: user4.id)
PaymentAccount.create!(balance: 500, user_id: user5.id)
PaymentAccount.create!(balance: 0, user_id: user6.id)
PaymentAccount.create!(balance: 500, user_id: user7.id)
PaymentAccount.create!(balance: 10, user_id: user8.id)
PaymentAccount.create!(balance: 120, user_id: user9.id)
PaymentAccount.create!(balance: 1000, user_id: user10.id)
PaymentAccount.create!(balance: 1, user_id: user11.id)
PaymentAccount.create!(balance: 1, user_id: user12.id)

# Payments
Payment.create!(sender_id: user1.id, recipient_id: user2.id, amount: 20, description: 'Pizza',
                created_at: 1.day.ago)
Payment.create!(sender_id: user2.id, recipient_id: user3.id, amount: 500, description: 'Enjoy your present!',
                created_at: 2.days.ago)
Payment.create!(sender_id: user2.id, recipient_id: user4.id, amount: 900, description: 'Shopping',
                created_at: 3.days.ago)
Payment.create!(sender_id: user4.id, recipient_id: user7.id, amount: 300, description: 'Party',
                created_at: 4.days.ago)
Payment.create!(sender_id: user10.id, recipient_id: user4.id, amount: 999, description: 'Happy Birthday!',
                created_at: 5.days.ago)
Payment.create!(sender_id: user6.id, recipient_id: user5.id, amount: 40, description: 'Thanks for your help',
                created_at: 6.days.ago)
Payment.create!(sender_id: user3.id, recipient_id: user9.id, amount: 5, description: 'Tickets',
                created_at: 7.days.ago)
Payment.create!(sender_id: user11.id, recipient_id: user12.id, amount: 5, description: 'Basket Jersey',
                created_at: 8.days.ago)
