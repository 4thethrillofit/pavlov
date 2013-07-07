User.delete_all
Challenge.delete_all
Participation.delete_all

u = User.create(humanapi_token: 'bf0bcadb894e4ad8c685870d69fced07920262f8', email: 'fab@gmail.com', name: 'Fab')
u2 = User.create(humanapi_token: '447b182358048beeb2aed22a430704e8f3e29d36', email: 'fei@gmail.com', name: 'Fei')
u3 = User.create(humanapi_token: 'a081e1439babba8bd274323bc2105742d82f815d', email: 'sidney@gmail.com', name: 'Sidney')
u3 = User.create(humanapi_token: '24e82d03d4c84fa5aa9877297a91b37f608fc200', email: 'sam@gmail.com', name: 'Sam')
c = u.created_challenges.create(activity_type: "steps", fitness_amount: 70000, dollars_per_person: 10, start_date: DateTime.new(2013,7,7), end_date: DateTime.new(2013,7,14))

c.participants << u2 << u3 << u4

