SELECT
	id,
	NPC,
  NPCEnd,
	Name,
	Information,
  Coins,
	Rewards,
	Requirements,
	Box,
	Vehicle,
  NextQuest,
  PreviousQuest
FROM
	quests
ORDER BY
	`ID` ASC