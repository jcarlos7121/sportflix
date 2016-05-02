SELECT users.id, name, sum(payments.cost) as ammount_payed from users join payments on (users.id = payments.user_id) group by users.id, users.name
