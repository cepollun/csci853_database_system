db.teaminfo.insert (
	{	
		"TEAM" : {
			"name" : "TEAM1",
			"city" : "Wuhan",
			"home-ground" : "WUHAN GYM",
			"Plays-for" : [{
				"PLAYER" : {
					"first-name" : "Chang",
					"last-name" : "Xu",
					"position" : "Center",
					"number" : 1}
				},
				{"PLAYER": {
					"first-name" : "Tony",
					"last-name" : "Stark",
					"position" : "Guard",
					"number" : 2
				}
			}],
			"Home-team" : [{
				"GAME" :{
					"game-number" : 103,
					"venue": "WUHAN GYM",
					"referee" : "Loki",
					"score-home-team": 89,
					"score-any-team" :20
				}
			}],
			"Away-team" : [{
				 	"GAME" :{
					"game-number" : 101,
					"venue": "Beijing GYM",
					"referee" : "Thor",
					"score-home-team": 29,
					"score-any-team" :30
				}
			}
			]
			
		}
	}
 );
 db.teaminfo.insert (
	{	
		"TEAM" : {
			"name" : "TEAM2",
			"city" : "Beijing",
			"home-ground" : "Beijing GYM",
			"Plays-for" : [{
				"PLAYER" : {
					"first-name" : "Green",
					"last-name" : "Hunk",
					"position" : "Center",
					"number" : 1}
				},
				{"PLAYER": {
					"first-name" : "Natasha",
					"last-name" : "BlackWidow",
					"position" : "Guard",
					"number" : 2}
				}
			],
			"Home-team" : [{
				"GAME" :{
					"game-number" : 101,
					"venue": "Beijing GYM",
					"referee" : "Thor",
					"score-home-team": 29,
					"score-any-team" :30
				}
			}],
			"Away-team" : [{
				 	"GAME" :{
					"game-number" : 103,
					"venue": "WUHAN GYM",
					"referee" : "Loki",
					"score-home-team": 89,
					"score-any-team" :20
				}
			}
			]
			
		}
	}
 );