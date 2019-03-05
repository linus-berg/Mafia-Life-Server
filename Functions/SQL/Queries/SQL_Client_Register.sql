INSERT INTO
	clients
	(
		UID,
		Email,
		Password,
		Salt
	)
VALUES
	(
		'%1',
		'%2',
		UNHEX('%3'),
		UNHEX('%4')
	)