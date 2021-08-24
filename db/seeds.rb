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

# Friendships
Friendship.create!(user_a: user1, user_b: user2)
Friendship.create!(user_a: user2, user_b: user3)
Friendship.create!(user_a: user2, user_b: user4)
Friendship.create!(user_a: user4, user_b: user7)
Friendship.create!(user_a: user4, user_b: user5)
Friendship.create!(user_a: user4, user_b: user10)
Friendship.create!(user_a: user3, user_b: user9)
Friendship.create!(user_a: user5, user_b: user6)
Friendship.create!(user_a: user6, user_b: user8)
Friendship.create!(user_a: user8, user_b: user4)

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

# Payments
Payment.create!(sender: user1, receiver: user2, amount: 20, description: 'Pizza',
                created_at: 1.day.ago)
Payment.create!(sender: user1, receiver: user3, amount: 500, description: 'Enjoy your present!',
                created_at: 2.days.ago)
Payment.create!(sender: user2, receiver: user4, amount: 900, description: 'Shopping',
                created_at: 3.days.ago)
Payment.create!(sender: user4, receiver: user7, amount: 300, description: 'Party',
                created_at: 4.days.ago)
Payment.create!(sender: user10, receiver: user4, amount: 1000, description: 'Happy Birthday!',
                created_at: 5.days.ago)
Payment.create!(sender: user6, receiver: user7, amount: 40, description: 'Thanks for your help',
                created_at: 6.days.ago)
Payment.create!(sender: user8, receiver: user9, amount: 5, description: 'Tickets',
                created_at: 7.days.ago)
