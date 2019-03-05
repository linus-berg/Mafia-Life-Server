SELECT
	Item,
	Price,
	Purchase,
	Sell,
	Permit
FROM
	item_list
WHERE
	Vendor = '%1'
ORDER BY
	`id` ASC