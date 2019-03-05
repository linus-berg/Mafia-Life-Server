SELECT 
  ID, 
  Sender,
  Subject,
  Message,
  Items,
  Coins,
  COD,
  Sent,
  `Read`
FROM 
  mail 
WHERE 
  UID = '%1' AND
  Sent > DATE_SUB(NOW(), INTERVAL 1 MONTH)
ORDER BY 
  `Sent` DESC;