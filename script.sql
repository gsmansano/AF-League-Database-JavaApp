create table teyvatleague.Position (
position_id int primary key,
position_name varchar (255),
position_area varchar (255)
);

create table teyvatleague.Coach (
coach_id int primary key,
coach_name varchar (255)
);

create table teyvatleague.Matchday (
matchday_id int primary key,
round_number int
);

create table teyvatleague.Team (
team_id int primary key,
coach_id int,
team_name varchar (255),
city varchar (255),
league_points int,
wins int,
losses int,
draws int,
foreign key (coach_id) references Coach(coach_id)
);

create table teyvatleague.Matches (
match_id int primary key,
matchday_id int,
hometeam_id int,
awayteam_id int,
city varchar (255),
home_score int,
away_score int,
number_injuries int,
foreign key (matchday_id) references Matchday(matchday_id),
foreign key (hometeam_id) references Team(team_id),
foreign key (awayteam_id) references Team(team_id)
);

create table teyvatleague.Player (
player_id int primary key,
team_id int,
position_id int,
last_name VARCHAR (255),
first_name VARCHAR (255),
skill_level int,
captaincy boolean,
total_injuries int,
foreign key (team_id) references Team(team_id),
foreign key (position_id) references Position (position_id)
);

create table teyvatleague.Injury (
injury_id int primary key,
player_id int,
match_id int,
inj_type varchar (255),
foreign key (player_id) references Player(player_id),
foreign key (match_id) references Matches(match_id)
);

INSERT INTO teyvatleague.Position (position_id, position_name, position_area)
VALUES
(1001, 'Quarterback', 'OF'),
(1002, 'Running Back', 'OF'),
(1003, 'Wide Receiver', 'OF'),
(1004, 'Offensive Lineman', 'OF'),
(1005, 'Defensive Lineman', 'DF'),
(1006, 'Linebacker', 'DF'),
(1007, 'Cornerback', 'DF'),
(1008, 'Safety', 'DF'),
(1009, 'Kicker', 'SP'),
(1010, 'Punter', 'SP'),
(1011, 'Long Snapper', 'SP'),
(1012, 'Returner', 'SP');

INSERT INTO teyvatleague.Coach (coach_id, coach_name)
VALUES
(2001, 'Klaus Schmidt'),
(2002, 'Anja Müller'),
(2003, 'Ivan Petrov'),
(2004, 'Wei Chen'),
(2005, 'Li Mei'),
(2006, 'Yang Liu'),
(2007, 'Hiroshi Tanaka'),
(2008, 'Yuki Suzuki'),
(2009, 'Raj Singh'),
(2010, 'Priya Patel'),
(2011, 'Ahmed Al-Farsi'),
(2012, 'Pierre Lefevre'),
(2013, 'Sophie Dubois'),
(2014, 'Antoine Martin');

INSERT INTO teyvatleague.Matchday (matchday_id, round_number)
VALUES
(3001, 1),
(3002, 1),
(3003, 1),
(3004, 2),
(3005, 2),
(3006, 2),
(3007, 3),
(3008, 3),
(3009, 3),
(3010, 4),
(3011, 4),
(3012, 4);

INSERT INTO teyvatleague.Team (team_id, coach_id, team_name, city)
VALUES
    (4001, 2001, 'Mondstadt Knights', 'Mondstadt'),
    (4002, 2002, 'Springvale Hunters', 'Mondstadt'),
    (4003, 2003, 'Fatuui Skirmishers', 'Shneznaya'),
    (4004, 2004, 'Liyue Harbor Milileth', 'Liyue'),
    (4005, 2005, 'Quince Village Youngs', 'Liyue'),
    (4006, 2006, 'Chasm Miners', 'Liyue'),
    (4007, 2007, 'Narukami Samurai', 'Inazuma'),
    (4008, 2008, 'Watatsumi Fighters', 'Inazuma'),
    (4009, 2009, 'Sumeru City Scholars', 'Sumeru'),
    (4010, 2010, 'Port Ormos Sailors', 'Sumeru'),
    (4011, 2011, 'Aaru Village Vultures', 'Sumeru'),
    (4012, 2012, 'Fontaine City Enforcers', 'Fontaine'),
    (4013, 2013, 'Poisson Village Survivors', 'Fontaine'),
    (4014, 2014, 'Meropide Inmates', 'Fontaine');
    
UPDATE teyvatleague.Team
SET league_points = 0, wins = 0, losses = 0, draws = 0
WHERE team_id BETWEEN 4001 AND 4014;
    
ALTER TABLE teyvatleague.Player
ADD COLUMN age INT;
    
INSERT INTO teyvatleague.Player (player_id, team_id, position_id, last_name, first_name, skill_level, captaincy, total_injuries, age)
VALUES
(5001, 4001, 1003, 'Müller', 'Lukas', 4, 0, 0, 28),
(5002, 4001, 1010, 'Schmidt', 'Maximilian', 1, 0, 0, 32),
(5003, 4001, 1008, 'Fischer', 'Jonas', 3, 1, 0, 24),
(5004, 4001, 1002, 'Wagner', 'Leon', 2, 0, 0, 31),
(5005, 4001, 1009, 'Becker', 'Niklas', 1, 0, 0, 26),
(5006, 4001, 1007, 'Richter', 'Felix', 5, 0, 0, 30),
(5007, 4001, 1005, 'Hoffmann', 'Timo', 3, 0, 0, 25),
(5008, 4001, 1004, 'Keller', 'Luca', 1, 0, 0, 33),
(5009, 4001, 1003, 'Schäfer', 'Elias', 2, 1, 0, 29),
(5010, 4001, 1006, 'Weber', 'Simon', 1, 0, 0, 22),
(5011, 4001, 1006, 'Braun', 'Noah', 4, 0, 0, 34),
(5012, 4001, 1001, 'Schneider', 'Paul', 2, 0, 0, 27),
(5013, 4001, 1004, 'Zimmermann', 'David', 5, 0, 0, 23),
(5014, 4001, 1002, 'Schmitt', 'Moritz', 3, 0, 0, 35),
(5015, 4001, 1008, 'Krause', 'Julius', 5, 1, 0, 22),
(5016, 4001, 1002, 'Huber', 'Ben', 3, 0, 0, 29),
(5017, 4001, 1011, 'Lehmann', 'Sebastian', 5, 0, 0, 30),
(5018, 4001, 1004, 'Baumann', 'Tom', 2, 0, 0, 32),
(5019, 4001, 1007, 'Haas', 'Jonathan', 4, 0, 0, 25),
(5020, 4001, 1005, 'Herrmann', 'Fabian', 1, 0, 0, 33),
(5021, 4001, 1009, 'Wagner', 'Daniel', 3, 0, 0, 28),
(5022, 4001, 1011, 'Koch', 'Michael', 5, 0, 0, 26),
(5023, 4001, 1001, 'Fischer', 'Marcel', 1, 0, 0, 34),
(5024, 4001, 1010, 'Lange', 'Kevin', 4, 0, 0, 22),
(5025, 4001, 1007, 'Bender', 'Marco', 2, 0, 0, 35),
(5026, 4001, 1001, 'Hartmann', 'Philipp', 4, 0, 0, 24),
(5027, 4001, 1012, 'Schwarz', 'Patrick', 3, 0, 0, 31),
(5028, 4001, 1005, 'Vogel', 'Martin', 5, 0, 0, 32);

INSERT INTO teyvatleague.Player (player_id, team_id, position_id, last_name, first_name, skill_level, captaincy, total_injuries, age)
VALUES
(5029, 4002, 1004, 'Schulz', 'Alexander', 2, 0, 0, 34),
(5030, 4002, 1001, 'Meier', 'Sebastian', 3, 0, 0, 36),
(5031, 4002, 1003, 'Becker', 'Jonas', 4, 1, 0, 31),
(5032, 4002, 1002, 'Hoffmann', 'Leon', 1, 0, 0, 25),
(5033, 4002, 1005, 'Wagner', 'Niklas', 5, 0, 0, 26),
(5034, 4002, 1009, 'Koch', 'Felix', 2, 0, 0, 27),
(5035, 4002, 1007, 'Fischer', 'Timo', 3, 0, 0, 33),
(5036, 4002, 1008, 'Bauer', 'Luca', 1, 0, 0, 35),
(5037, 4002, 1006, 'Schmidt', 'Elias', 4, 1, 0, 30),
(5038, 4002, 1001, 'Schneider', 'Simon', 3, 0, 0, 28),
(5039, 4002, 1008, 'Müller', 'Noah', 5, 0, 0, 31),
(5040, 4002, 1007, 'Huber', 'Paul', 1, 0, 0, 24),
(5041, 4002, 1012, 'Berg', 'David', 2, 0, 0, 38),
(5042, 4002, 1002, 'Schmitt', 'Moritz', 4, 0, 0, 32),
(5043, 4002, 1001, 'Krause', 'Julius', 1, 1, 0, 25),
(5044, 4002, 1005, 'Meyer', 'Ben', 3, 0, 0, 36),
(5045, 4002, 1007, 'Lehmann', 'Sebastian', 5, 0, 0, 28),
(5046, 4002, 1006, 'Baumann', 'Tom', 1, 0, 0, 29),
(5047, 4002, 1009, 'Haas', 'Jonathan', 2, 0, 0, 37),
(5048, 4002, 1003, 'Herrmann', 'Fabian', 4, 0, 0, 26),
(5049, 4002, 1005, 'Wagner', 'Daniel', 3, 0, 0, 25),
(5050, 4002, 1004, 'Koch', 'Michael', 5, 0, 0, 33),
(5051, 4002, 1006, 'Fischer', 'Marcel', 1, 0, 0, 24),
(5052, 4002, 1012, 'Lange', 'Kevin', 4, 0, 0, 34),
(5053, 4002, 1005, 'Bender', 'Marco', 2, 0, 0, 27);

INSERT INTO teyvatleague.Player (player_id, team_id, position_id, last_name, first_name, skill_level, captaincy, total_injuries, age)
VALUES
(5054, 4003, 1002, 'Ivanov', 'Alexei', 3, 0, 0, 27),
(5055, 4003, 1005, 'Petrov', 'Dmitri', 4, 0, 0, 35),
(5056, 4003, 1001, 'Sokolov', 'Viktor', 2, 0, 0, 29),
(5057, 4003, 1004, 'Popov', 'Nikolai', 5, 0, 0, 26),
(5058, 4003, 1003, 'Kuznetsov', 'Andrei', 1, 1, 0, 31),
(5059, 4003, 1007, 'Volkov', 'Igor', 3, 0, 0, 24),
(5060, 4003, 1012, 'Smirnov', 'Pavel', 4, 0, 0, 32),
(5061, 4003, 1006, 'Ilyin', 'Sergei', 2, 0, 0, 36),
(5062, 4003, 1001, 'Romanov', 'Dmitry', 5, 0, 0, 28),
(5063, 4003, 1008, 'Fedorov', 'Artem', 1, 0, 0, 25),
(5064, 4003, 1007, 'Yakovlev', 'Ivan', 3, 0, 0, 37),
(5065, 4003, 1005, 'Vasilyev', 'Konstantin', 4, 0, 0, 30),
(5066, 4003, 1009, 'Orlov', 'Mikhail', 2, 0, 0, 34),
(5067, 4003, 1002, 'Kozlov', 'Anton', 5, 1, 0, 24),
(5068, 4003, 1001, 'Bogdanov', 'Vladimir', 1, 0, 0, 33),
(5069, 4003, 1004, 'Grigoriev', 'Denis', 3, 0, 0, 29),
(5070, 4003, 1007, 'Egorov', 'Nikita', 5, 0, 0, 28),
(5071, 4003, 1006, 'Makarov', 'Yuri', 2, 0, 0, 26),
(5072, 4003, 1009, 'Nikitin', 'Ilya', 4, 0, 0, 30),
(5073, 4003, 1003, 'Vinogradov', 'Evgeny', 1, 0, 0, 35),
(5074, 4003, 1005, 'Smolov', 'Semyon', 3, 0, 0, 27),
(5075, 4003, 1004, 'Pavlov', 'Boris', 5, 0, 0, 25),
(5076, 4003, 1012, 'Sorokin', 'Aleksandr', 4, 0, 0, 32),
(5077, 4003, 1006, 'Konovalov', 'Ivan', 1, 0, 0, 33),
(5078, 4003, 1002, 'Korolev', 'Vladislav', 3, 1, 0, 24),
(5079, 4003, 1001, 'Belyakov', 'Dmitry', 2, 0, 0, 26),
(5080, 4003, 1007, 'Fomin', 'Sergey', 5, 0, 0, 38),
(5081, 4003, 1008, 'Andreev', 'Alexey', 4, 0, 0, 31),
(5082, 4003, 1006, 'Titov', 'Artem', 1, 0, 0, 37),
(5083, 4004, 1003, 'Li', 'Wei', 4, 0, 0, 32),
(5084, 4004, 1001, 'Wang', 'Jing', 1, 0, 0, 28),
(5085, 4004, 1005, 'Zhang', 'Lei', 3, 0, 0, 36),
(5086, 4004, 1002, 'Chen', 'Yong', 5, 0, 0, 30),
(5087, 4004, 1004, 'Liu', 'Xing', 2, 1, 0, 24),
(5088, 4004, 1012, 'Huang', 'Ming', 4, 0, 0, 38),
(5089, 4004, 1007, 'Wu', 'Kai', 1, 0, 0, 35),
(5090, 4004, 1006, 'Xu', 'Hao', 3, 0, 0, 27),
(5091, 4004, 1009, 'Tang', 'Jian', 2, 0, 0, 29),
(5092, 4004, 1008, 'Sun', 'Xin', 5, 0, 0, 26),
(5093, 4004, 1007, 'Zhao', 'Cheng', 1, 0, 0, 33),
(5094, 4004, 1005, 'Deng', 'Lin', 4, 0, 0, 25),
(5095, 4004, 1009, 'Gao', 'Jun', 2, 0, 0, 34),
(5096, 4004, 1002, 'Hu', 'Wen', 5, 1, 0, 21),
(5097, 4004, 1001, 'Yang', 'Xiang', 3, 0, 0, 26),
(5098, 4004, 1004, 'Zhou', 'Qiang', 1, 0, 0, 30),
(5099, 4004, 1007, 'Wang', 'Ming', 5, 0, 0, 38),
(5100, 4004, 1006, 'Chen', 'Tao', 2, 0, 0, 32),
(5101, 4004, 1009, 'Liu', 'Jie', 4, 0, 0, 37),
(5102, 4004, 1003, 'Xu', 'Feng', 1, 0, 0, 28),
(5103, 4004, 1005, 'Li', 'Hong', 3, 0, 0, 22),
(5104, 4004, 1004, 'Zhang', 'Yan', 5, 0, 0, 31),
(5105, 4004, 1008, 'Cheng', 'Lin', 2, 1, 0, 29),
(5106, 4004, 1012, 'Liu', 'Jian', 4, 0, 0, 35),
(5107, 4004, 1003, 'Wang', 'Xin', 1, 0, 0, 23),
(5108, 4004, 1006, 'Zhang', 'Yi', 3, 0, 0, 27),
(5109, 4004, 1002, 'Zhao', 'Ming', 5, 0, 0, 33),
(5110, 4004, 1001, 'Liu', 'Jin', 2, 0, 0, 30),
(5111, 4004, 1005, 'Wang', 'Tao', 4, 0, 0, 24),
(5112, 4004, 1009, 'Zhang', 'Wei', 1, 0, 0, 37),
(5113, 4004, 1007, 'Li', 'Yuan', 3, 0, 0, 26),
(5114, 4004, 1003, 'Chen', 'Zhang', 5, 0, 0, 21),
(5115, 4004, 1008, 'Wang', 'Yi', 2, 1, 0, 38),
(5116, 4005, 1002, 'Chen', 'Jie', 4, 0, 0, 28),
(5117, 4005, 1004, 'Wang', 'Lei', 1, 0, 0, 22),
(5118, 4005, 1006, 'Zhang', 'Hao', 3, 0, 0, 25),
(5119, 4005, 1009, 'Liu', 'Xin', 5, 0, 0, 30),
(5120, 4005, 1003, 'Wu', 'Cheng', 2, 1, 0, 26),
(5121, 4005, 1012, 'Huang', 'Yan', 4, 0, 0, 18),
(5122, 4005, 1001, 'Zhao', 'Ming', 1, 0, 0, 29),
(5123, 4005, 1007, 'Xu', 'Wei', 3, 0, 0, 24),
(5124, 4005, 1008, 'Tang', 'Jian', 2, 0, 0, 27),
(5125, 4005, 1005, 'Sun', 'Yi', 5, 0, 0, 30),
(5126, 4005, 1009, 'Chen', 'Zhang', 1, 0, 0, 28),
(5127, 4005, 1007, 'Deng', 'Lin', 4, 0, 0, 23),
(5128, 4005, 1002, 'Gao', 'Jun', 2, 0, 0, 30),
(5129, 4005, 1001, 'Hu', 'Wen', 5, 1, 0, 29),
(5130, 4005, 1005, 'Yang', 'Xiang', 3, 0, 0, 22),
(5131, 4005, 1003, 'Zhou', 'Qiang', 1, 0, 0, 30),
(5132, 4005, 1008, 'Wang', 'Ming', 5, 0, 0, 25),
(5133, 4005, 1006, 'Chen', 'Tao', 2, 0, 0, 26),
(5134, 4005, 1009, 'Liu', 'Jie', 4, 0, 0, 28),
(5135, 4005, 1004, 'Xu', 'Feng', 1, 0, 0, 30),
(5136, 4005, 1001, 'Li', 'Hong', 3, 0, 0, 19),
(5137, 4005, 1007, 'Zhang', 'Yan', 5, 0, 0, 25),
(5138, 4005, 1002, 'Cheng', 'Lin', 2, 1, 0, 28),
(5139, 4005, 1012, 'Liu', 'Jian', 4, 0, 0, 30),
(5140, 4005, 1003, 'Wang', 'Xin', 1, 0, 0, 22),
(5141, 4006, 1001, 'Chen', 'Hao', 4, 0, 0, 28),
(5142, 4006, 1002, 'Wang', 'Xin', 1, 0, 0, 22),
(5143, 4006, 1003, 'Zhang', 'Wei', 3, 0, 0, 25),
(5144, 4006, 1004, 'Liu', 'Ming', 5, 0, 0, 30),
(5145, 4006, 1005, 'Wu', 'Jie', 2, 1, 0, 26),
(5146, 4006, 1006, 'Huang', 'Yan', 4, 0, 0, 18),
(5147, 4006, 1007, 'Zhao', 'Lin', 1, 0, 0, 29),
(5148, 4006, 1008, 'Xu', 'Cheng', 3, 0, 0, 24),
(5149, 4006, 1009, 'Tang', 'Yi', 2, 0, 0, 27),
(5150, 4006, 1010, 'Sun', 'Jian', 5, 0, 0, 30),
(5151, 4006, 1011, 'Chen', 'Zhang', 1, 0, 0, 28),
(5152, 4006, 1012, 'Deng', 'Lin', 4, 0, 0, 23),
(5153, 4006, 1001, 'Gao', 'Jun', 2, 0, 0, 30),
(5154, 4006, 1002, 'Hu', 'Wen', 5, 1, 0, 29),
(5155, 4006, 1003, 'Yang', 'Xiang', 3, 0, 0, 22),
(5156, 4006, 1004, 'Zhou', 'Qiang', 1, 0, 0, 30),
(5157, 4006, 1005, 'Wang', 'Ming', 5, 0, 0, 25),
(5158, 4006, 1006, 'Chen', 'Tao', 2, 0, 0, 26),
(5159, 4006, 1007, 'Liu', 'Jie', 4, 0, 0, 28),
(5160, 4006, 1008, 'Xu', 'Feng', 1, 0, 0, 30),
(5161, 4006, 1009, 'Li', 'Hong', 3, 0, 0, 19),
(5162, 4006, 1010, 'Zhang', 'Yan', 5, 0, 0, 25),
(5163, 4006, 1011, 'Cheng', 'Lin', 2, 1, 0, 28),
(5164, 4006, 1001, 'Liu', 'Jian', 4, 0, 0, 30),
(5165, 4006, 1002, 'Wang', 'Xin', 1, 0, 0, 22),
(5166, 4007, 1001, 'Yamamoto', 'Takeshi', 4, 0, 0, 28),
(5167, 4007, 1002, 'Suzuki', 'Hiroshi', 1, 0, 0, 22),
(5168, 4007, 1003, 'Takahashi', 'Kenji', 3, 0, 0, 25),
(5169, 4007, 1004, 'Watanabe', 'Yoshida', 5, 0, 0, 30),
(5170, 4007, 1005, 'Ito', 'Haruto', 2, 1, 0, 26),
(5171, 4007, 1006, 'Nakamura', 'Satoshi', 4, 0, 0, 18),
(5172, 4007, 1007, 'Kobayashi', 'Ryo', 1, 0, 0, 29),
(5173, 4007, 1008, 'Yoshida', 'Akihiro', 3, 0, 0, 24),
(5174, 4007, 1009, 'Sato', 'Kaito', 2, 0, 0, 27),
(5175, 4007, 1010, 'Ishikawa', 'Takashi', 5, 0, 0, 30),
(5176, 4007, 1011, 'Saito', 'Tetsuya', 1, 0, 0, 28),
(5177, 4007, 1012, 'Fujita', 'Riku', 4, 0, 0, 23),
(5178, 4007, 1001, 'Abe', 'Shinichi', 2, 0, 0, 30),
(5179, 4007, 1002, 'Matsuda', 'Kenta', 5, 1, 0, 29),
(5180, 4007, 1003, 'Okamoto', 'Taichi', 3, 0, 0, 22),
(5181, 4007, 1004, 'Inoue', 'Yuki', 1, 0, 0, 30),
(5182, 4007, 1005, 'Kato', 'Makoto', 5, 0, 0, 25),
(5183, 4007, 1006, 'Ishii', 'Hiroki', 2, 0, 0, 26),
(5184, 4007, 1007, 'Nakajima', 'Yuta', 4, 0, 0, 28),
(5185, 4007, 1008, 'Kawasaki', 'Yusuke', 1, 0, 0, 30),
(5186, 4007, 1009, 'Tanaka', 'Kazuki', 3, 0, 0, 19),
(5187, 4007, 1010, 'Ogawa', 'Taro', 5, 0, 0, 25),
(5188, 4007, 1011, 'Hasegawa', 'Yoshio', 2, 1, 0, 28),
(5189, 4007, 1001, 'Kondo', 'Ryota', 4, 0, 0, 30),
(5190, 4007, 1002, 'Yamaguchi', 'Yuki', 1, 0, 0, 22),
(5191, 4007, 1003, 'Ono', 'Ryoichi', 3, 0, 0, 25),
(5192, 4007, 1004, 'Kobayashi', 'Sho', 2, 0, 0, 27),
(5193, 4007, 1005, 'Ito', 'Kota', 5, 0, 0, 30),
(5194, 4007, 1006, 'Suzuki', 'Yuta', 4, 0, 0, 28),
(5195, 4007, 1007, 'Fujimoto', 'Yuki', 1, 0, 0, 30),
(5196, 4008, 1004, 'Sato', 'Ryota', 3, 0, 0, 24),
(5197, 4008, 1007, 'Takahashi', 'Haruki', 5, 0, 0, 30),
(5198, 4008, 1003, 'Watanabe', 'Kazuki', 2, 0, 0, 26),
(5199, 4008, 1006, 'Yamamoto', 'Yuto', 4, 0, 0, 22),
(5200, 4008, 1002, 'Nakamura', 'Takashi', 1, 1, 0, 28),
(5201, 4008, 1008, 'Ishikawa', 'Riku', 3, 0, 0, 25),
(5202, 4008, 1010, 'Kobayashi', 'Yuki', 5, 0, 0, 22),
(5203, 4008, 1009, 'Suzuki', 'Yota', 2, 0, 0, 27),
(5204, 4008, 1011, 'Yoshida', 'Taro', 4, 0, 0, 32),
(5205, 4008, 1001, 'Abe', 'Ren', 1, 0, 0, 30),
(5206, 4008, 1005, 'Fujita', 'Kota', 5, 0, 0, 20),
(5207, 4008, 1012, 'Okamoto', 'Daiki', 2, 1, 0, 35),
(5208, 4008, 1001, 'Yamada', 'Hiroshi', 4, 0, 0, 28),
(5209, 4008, 1012, 'Ito', 'Kota', 1, 0, 0, 30),
(5210, 4008, 1005, 'Tanaka', 'Yuki', 3, 0, 0, 25),
(5211, 4008, 1009, 'Saito', 'Kaito', 5, 0, 0, 22),
(5212, 4008, 1004, 'Matsuda', 'Kenta', 1, 0, 0, 29),
(5213, 4008, 1006, 'Ito', 'Taichi', 5, 0, 0, 26),
(5214, 4008, 1002, 'Kawasaki', 'Yusuke', 3, 0, 0, 26),
(5215, 4008, 1007, 'Sato', 'Ren', 2, 0, 0, 22),
(5216, 4008, 1011, 'Nakajima', 'Yuki', 4, 0, 0, 28),
(5217, 4008, 1008, 'Kondo', 'Ryota', 1, 0, 0, 30),
(5218, 4008, 1003, 'Yamaguchi', 'Yuta', 3, 0, 0, 25),
(5219, 4008, 1010, 'Ono', 'Ryoichi', 5, 0, 0, 22),
(5220, 4008, 1001, 'Kobayashi', 'Sho', 2, 0, 0, 27),
(5221, 4008, 1002, 'Ishii', 'Hiroki', 4, 0, 0, 32),
(5222, 4008, 1005, 'Nakajima', 'Yuta', 1, 0, 0, 30),
(5223, 4009, 1003, 'Patel', 'Aarav', 3, 0, 0, 20),
(5224, 4009, 1011, 'Kumar', 'Vikram', 5, 0, 0, 26),
(5225, 4009, 1002, 'Singh', 'Rohan', 2, 0, 0, 32),
(5226, 4009, 1004, 'Sharma', 'Arjun', 4, 0, 0, 22),
(5227, 4009, 1006, 'Gupta', 'Aryan', 1, 1, 0, 28),
(5228, 4009, 1010, 'Khan', 'Ishaan', 3, 0, 0, 25),
(5229, 4009, 1005, 'Verma', 'Amit', 5, 0, 0, 30),
(5230, 4009, 1007, 'Das', 'Rahul', 2, 0, 0, 27),
(5231, 4009, 1008, 'Yadav', 'Ravi', 4, 0, 0, 22),
(5232, 4009, 1012, 'Malik', 'Aryan', 1, 0, 0, 30),
(5233, 4009, 1011, 'Shah', 'Aniket', 5, 0, 0, 22),
(5234, 4009, 1009, 'Reddy', 'Amitabh', 3, 1, 0, 28),
(5235, 4009, 1001, 'Bhat', 'Aditya', 4, 0, 0, 32),
(5236, 4009, 1008, 'Mishra', 'Rahul', 1, 0, 0, 27),
(5237, 4009, 1003, 'Jain', 'Amit', 3, 0, 0, 25),
(5238, 4009, 1012, 'Kaur', 'Riya', 5, 0, 0, 22),
(5239, 4009, 1010, 'Mittal', 'Vishal', 2, 0, 0, 28),
(5240, 4009, 1004, 'Rao', 'Siddharth', 4, 0, 0, 30),
(5241, 4009, 1007, 'Thakur', 'Raj', 1, 0, 0, 25),
(5242, 4009, 1005, 'Nair', 'Aryan', 3, 0, 0, 22),
(5243, 4009, 1006, 'Pandey', 'Kunal', 5, 0, 0, 27),
(5244, 4009, 1009, 'Shukla', 'Amit', 2, 0, 0, 32),
(5245, 4009, 1002, 'Verma', 'Aniket', 4, 0, 0, 30),
(5246, 4009, 1011, 'Sinha', 'Rahul', 1, 0, 0, 25),
(5247, 4009, 1001, 'Agarwal', 'Amit', 3, 0, 0, 22),
(5248, 4009, 1006, 'Pillai', 'Aryan', 5, 0, 0, 28),
(5249, 4009, 1012, 'Gandhi', 'Vikas', 2, 0, 0, 30),
(5250, 4010, 1011, 'Kumar', 'Rajesh', 3, 0, 0, 32),
(5251, 4010, 1009, 'Patel', 'Arjun', 5, 0, 0, 28),
(5252, 4010, 1007, 'Singh', 'Rahul', 2, 0, 0, 30),
(5253, 4010, 1002, 'Sharma', 'Vikas', 4, 0, 0, 25),
(5254, 4010, 1001, 'Verma', 'Siddharth', 1, 1, 0, 22),
(5255, 4010, 1005, 'Mishra', 'Ravi', 3, 0, 0, 27),
(5256, 4010, 1010, 'Yadav', 'Vishal', 5, 0, 0, 30),
(5257, 4010, 1008, 'Kaur', 'Aishwarya', 2, 0, 0, 22),
(5258, 4010, 1004, 'Malik', 'Rajat', 4, 0, 0, 28),
(5259, 4010, 1012, 'Rao', 'Aniket', 1, 0, 0, 30),
(5260, 4010, 1006, 'Sinha', 'Amit', 3, 0, 0, 25),
(5261, 4010, 1003, 'Nair', 'Rahul', 5, 0, 0, 22),
(5262, 4010, 1004, 'Kumar', 'Aryan', 2, 0, 0, 27),
(5263, 4010, 1009, 'Pandey', 'Aditya', 4, 0, 0, 28),
(5264, 4010, 1001, 'Shukla', 'Ishaan', 1, 0, 0, 30),
(5265, 4010, 1007, 'Thakur', 'Aryan', 3, 0, 0, 25),
(5266, 4010, 1011, 'Nair', 'Aniket', 5, 0, 0, 22),
(5267, 4010, 1006, 'Mittal', 'Rahul', 2, 0, 0, 27),
(5268, 4010, 1003, 'Shah', 'Aryan', 4, 0, 0, 28),
(5269, 4010, 1002, 'Rao', 'Vishal', 1, 0, 0, 30),
(5270, 4010, 1008, 'Kaur', 'Siddharth', 3, 0, 0, 25),
(5271, 4010, 1005, 'Verma', 'Rahul', 5, 0, 0, 22),
(5272, 4010, 1004, 'Pillai', 'Amit', 2, 0, 0, 27),
(5273, 4010, 1009, 'Gandhi', 'Aniket', 4, 0, 0, 28),
(5274, 4010, 1001, 'Jain', 'Rahul', 1, 0, 0, 30),
(5275, 4010, 1008, 'Bhat', 'Aryan', 3, 0, 0, 25),
(5276, 4011, 1002, 'Abdullah', 'Omar', 3, 0, 0, 32),
(5277, 4011, 1005, 'Ahmed', 'Ali', 5, 0, 0, 28),
(5278, 4011, 1007, 'Khalid', 'Amir', 2, 0, 0, 30),
(5279, 4011, 1003, 'Al-Farsi', 'Yousef', 4, 0, 0, 25),
(5280, 4011, 1011, 'Saeed', 'Karim', 1, 1, 0, 22),
(5281, 4011, 1010, 'Nasser', 'Jamal', 3, 0, 0, 27),
(5282, 4011, 1006, 'Makhlouf', 'Samir', 5, 0, 0, 30),
(5283, 4011, 1009, 'Abdel-Rahman', 'Tariq', 2, 0, 0, 22),
(5284, 4011, 1001, 'Hassan', 'Mustafa', 4, 0, 0, 28),
(5285, 4011, 1012, 'El-Sayed', 'Yusuf', 1, 0, 0, 30),
(5286, 4011, 1004, 'Omar', 'Ahmed', 3, 0, 0, 25),
(5287, 4011, 1009, 'Ghazi', 'Fadi', 5, 0, 0, 22),
(5288, 4011, 1001, 'Al-Mansoori', 'Tariq', 2, 0, 0, 27),
(5289, 4011, 1008, 'Siddiqi', 'Bilal', 4, 0, 0, 28),
(5290, 4011, 1002, 'Ibrahim', 'Zayd', 1, 0, 0, 30),
(5291, 4011, 1007, 'Al-Farsi', 'Karim', 3, 0, 0, 25),
(5292, 4011, 1011, 'Al-Hakim', 'Musa', 5, 0, 0, 22),
(5293, 4011, 1006, 'Al-Qureshi', 'Nasir', 2, 0, 0, 27),
(5294, 4011, 1003, 'Al-Hakim', 'Rami', 4, 0, 0, 28),
(5295, 4011, 1005, 'Saeed', 'Omar', 1, 0, 0, 30),
(5296, 4011, 1008, 'Abdullah', 'Zayd', 3, 0, 0, 25),
(5297, 4011, 1004, 'Nasser', 'Musa', 5, 0, 0, 22),
(5298, 4011, 1002, 'Hassan', 'Rami', 2, 0, 0, 27),
(5299, 4011, 1012, 'Ahmed', 'Yusuf', 4, 0, 0, 28),
(5300, 4011, 1007, 'Abdel-Rahman', 'Bilal', 1, 0, 0, 30),
(5301, 4012, 1007, 'Leclerc', 'Jean', 4, 1, 0, 29),
(5302, 4012, 1005, 'Lefevre', 'Pierre', 3, 0, 0, 33),
(5303, 4012, 1008, 'Roux', 'Luc', 1, 0, 0, 27),
(5304, 4012, 1004, 'Martin', 'Philippe', 2, 0, 0, 25),
(5305, 4012, 1011, 'Girard', 'Francois', 5, 0, 0, 28),
(5306, 4012, 1002, 'Leroux', 'Jacques', 4, 0, 0, 31),
(5307, 4012, 1009, 'Bertrand', 'Henri', 3, 0, 0, 30),
(5308, 4012, 1001, 'Dubois', 'Paul', 2, 0, 0, 33),
(5309, 4012, 1003, 'Moreau', 'Andre', 1, 0, 0, 27),
(5310, 4012, 1012, 'Lemaire', 'Yves', 4, 0, 0, 29),
(5311, 4012, 1006, 'Garnier', 'Michel', 5, 0, 0, 31),
(5312, 4012, 1010, 'Blanc', 'Bruno', 3, 0, 0, 26),
(5313, 4012, 1010, 'Rousseau', 'Albert', 2, 0, 0, 32),
(5314, 4012, 1006, 'Leroy', 'Denis', 1, 0, 0, 29),
(5315, 4012, 1003, 'Guillaume', 'Julien', 4, 0, 0, 27),
(5316, 4012, 1004, 'Gauthier', 'Louis', 5, 0, 0, 31),
(5317, 4012, 1001, 'Petit', 'Alexandre', 2, 0, 0, 28),
(5318, 4012, 1011, 'Bouchard', 'Christian', 3, 0, 0, 30),
(5319, 4012, 1008, 'Michel', 'Jean-Pierre', 1, 0, 0, 33),
(5320, 4012, 1005, 'Thomas', 'Yannick', 5, 0, 0, 28),
(5321, 4012, 1002, 'Lefevre', 'Laurent', 4, 0, 0, 29),
(5322, 4012, 1009, 'Renaud', 'Dominique', 3, 0, 0, 30),
(5323, 4012, 1007, 'Marchand', 'Antoine', 2, 0, 0, 31),
(5324, 4012, 1004, 'Lemoine', 'Paul-Henri', 1, 0, 0, 32),
(5325, 4012, 1012, 'Robert', 'Sebastien', 4, 0, 0, 29),
(5326, 4012, 1006, 'Benoit', 'Lucien', 5, 0, 0, 33),
(5327, 4012, 1003, 'Rey', 'Guy', 3, 0, 0, 27),
(5328, 4012, 1001, 'Maurice', 'Alain', 1, 0, 0, 30),
(5329, 4013, 1007, 'Dubois', 'Julien', 2, 0, 0, 23),
(5330, 4013, 1005, 'Leroux', 'Nicolas', 3, 0, 0, 31),
(5331, 4013, 1008, 'Rousseau', 'Laurent', 4, 0, 0, 29),
(5332, 4013, 1004, 'Girard', 'Vincent', 1, 0, 0, 28),
(5333, 4013, 1011, 'Lefevre', 'Jean', 5, 0, 0, 26),
(5334, 4013, 1002, 'Garnier', 'Pierre', 3, 0, 0, 33),
(5335, 4013, 1009, 'Boucher', 'Philippe', 4, 0, 0, 27),
(5336, 4013, 1001, 'Martin', 'Jacques', 2, 0, 0, 30),
(5337, 4013, 1003, 'Bertrand', 'Francois', 1, 0, 0, 29),
(5338, 4013, 1012, 'Moreau', 'Yves', 5, 0, 0, 28),
(5339, 4013, 1006, 'Blanc', 'Michel', 4, 0, 0, 31),
(5340, 4013, 1010, 'Lemaire', 'Bruno', 3, 0, 0, 26),
(5341, 4013, 1010, 'Leroy', 'Albert', 2, 0, 0, 32),
(5342, 4013, 1006, 'Guillaume', 'Denis', 1, 0, 0, 29),
(5343, 4013, 1003, 'Gauthier', 'Julien', 4, 0, 0, 27),
(5344, 4013, 1004, 'Petit', 'Louis', 5, 0, 0, 31),
(5345, 4013, 1001, 'Bouchard', 'Alexandre', 2, 0, 0, 28),
(5346, 4013, 1011, 'Michel', 'Christian', 3, 0, 0, 30),
(5347, 4013, 1008, 'Renaud', 'Henri', 1, 0, 0, 33),
(5348, 4013, 1005, 'Thomas', 'Yannick', 5, 0, 0, 28),
(5349, 4013, 1002, 'Lefevre', 'Laurent', 4, 0, 0, 29),
(5350, 4013, 1009, 'Marchand', 'Dominique', 3, 0, 0, 30),
(5351, 4013, 1007, 'Lemoine', 'Antoine', 2, 0, 0, 31),
(5352, 4013, 1004, 'Robert', 'Paul-Henri', 1, 0, 0, 32),
(5353, 4013, 1012, 'Benoit', 'Sebastien', 4, 0, 0, 29),
(5354, 4013, 1006, 'Rey', 'Lucien', 5, 0, 0, 33),
(5355, 4013, 1003, 'Maurice', 'Guy', 3, 0, 0, 27),
(5356, 4013, 1001, 'Leroux', 'Alain', 1, 0, 0, 30),
(5357, 4014, 1008, 'Roux', 'Francois', 3, 0, 0, 24),
(5358, 4014, 1005, 'Martel', 'Alexandre', 2, 0, 0, 29),
(5359, 4014, 1011, 'Bertrand', 'Luc', 4, 0, 0, 27),
(5360, 4014, 1004, 'Dupont', 'Henri', 1, 0, 0, 32),
(5361, 4014, 1003, 'Girard', 'Jacques', 5, 0, 0, 31),
(5362, 4014, 1002, 'Benoit', 'Paul', 2, 0, 0, 28),
(5363, 4014, 1001, 'Renaud', 'Philippe', 3, 0, 0, 29),
(5364, 4014, 1009, 'Lefevre', 'Yves', 4, 0, 0, 33),
(5365, 4014, 1006, 'Rousseau', 'Pierre', 5, 0, 0, 26),
(5366, 4014, 1010, 'Morel', 'Laurent', 3, 0, 0, 30),
(5367, 4014, 1007, 'Fournier', 'Daniel', 4, 0, 0, 31),
(5368, 4014, 1012, 'Guillaume', 'Roger', 2, 0, 0, 27),
(5369, 4014, 1004, 'Lemoine', 'Jean', 1, 0, 0, 29),
(5370, 4014, 1003, 'Roussel', 'Andre', 5, 0, 0, 30),
(5371, 4014, 1008, 'Lefevre', 'Francois', 4, 0, 0, 28),
(5372, 4014, 1011, 'Maurice', 'Eric', 3, 0, 0, 31),
(5373, 4014, 1010, 'Leroy', 'Bernard', 1, 0, 0, 32),
(5374, 4014, 1006, 'Moreau', 'Daniel', 2, 0, 0, 30),
(5375, 4014, 1012, 'Leroux', 'Luc', 5, 0, 0, 26),
(5376, 4014, 1002, 'Leroux', 'Gilles', 4, 0, 0, 29),
(5377, 4014, 1005, 'Lefevre', 'Michel', 3, 0, 0, 28),
(5378, 4014, 1001, 'Garnier', 'Bernard', 2, 0, 0, 33),
(5379, 4014, 1009, 'Michel', 'Jean-Claude', 1, 0, 0, 30),
(5380, 4014, 1007, 'Boucher', 'Philippe', 5, 0, 0, 29),
(5381, 4014, 1003, 'Robert', 'Lucien', 4, 0, 0, 27),
(5382, 4014, 1004, 'Girard', 'Alexandre', 2, 0, 0, 32),
(5383, 4014, 1006, 'Bouchard', 'Sebastien', 3, 0, 0, 29),
(5384, 4014, 1008, 'Leroux', 'Philippe', 1, 0, 0, 28);

ALTER TABLE teyvatleague.Matchday
ADD COLUMN matchday_date date;

DELETE FROM teyvatleague.matchday
WHERE matchday_id BETWEEN 3001 AND 3012;

INSERT INTO teyvatleague.Matchday (matchday_id, round_number, matchday_date)
VALUES
(3001, 1, '2023-06-26'),
(3002, 1, '2023-06-28'),
(3003, 1, '2023-06-30'),
(3004, 2, '2023-07-03'),
(3005, 2, '2023-07-05'),
(3006, 2, '2023-07-07'),
(3007, 3, '2023-07-10'),
(3008, 3, '2023-07-12'),
(3009, 3, '2023-07-14'),
(3010, 4, '2023-07-17'),
(3011, 4, '2023-07-19'),
(3012, 4, '2023-07-21');


INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6001, 3001, 4001, 4006, 'Mondstadt', 32, 25, 1),
(6002, 3001, 4002, 4012, 'Mondstadt', 10, 15, 0);

INSERT INTO teyvatleague.Injury (injury_id, player_id, match_id, inj_type)
VALUES
(7001, 5162, 6001, 'Strain');

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4001;

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4006;

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4002;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4002;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5162;



INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6003, 3002, 4003, 4011, 'Shneznaya', 12, 12, 3),
(6004, 3002, 4004, 4013, 'Liyue', 21, 5, 1);

INSERT INTO teyvatleague.Injury (injury_id, player_id, match_id, inj_type)
VALUES
(7002, 5280, 6003, 'Muscle Strain'),
(7003, 5284, 6003, 'Joint Dislocation'),
(7004, 5057, 6003, 'Ligament Sprain'),
(7005, 5086, 6004, 'Bone Fracture');

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4003;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4011;

UPDATE teyvatleague.Team
SET league_points = league_points +3, wins = wins  + 1, losses = losses, draws = draws
WHERE team_id = 4004;

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins + 1, losses = losses  + 1, draws = draws
WHERE team_id = 4013;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5280;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5284;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5057;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5086;



INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6005, 3003, 4005, 4008, 'Liyue', 10, 13, 1),
(6006, 3003, 4007, 4010, 'Inazuma', 5, 5, 0),
(6007, 3003, 4009, 4014, 'Sumeru', 18, 17, 1);

INSERT INTO teyvatleague.Injury (injury_id, player_id, match_id, inj_type)
VALUES
(7006, 5134, 6005, 'Bone Fracture'),
(7007, 5364, 6007, 'Muscle Strain');

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses  + 1, draws = draws
WHERE team_id = 4005;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4008;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4007;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4010;

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4009;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4014;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5134;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5364;




INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6008, 3004, 4001, 4002, 'Mondstadt', 2, 3, 2),
(6009, 3004, 4006, 4003, 'Liyue', 7, 7, 1),
(6010, 3004, 4012, 4004, 'Fontaine', 20, 20, 1);

INSERT INTO teyvatleague.Injury (injury_id, player_id, match_id, inj_type)
VALUES
(7008, 5028, 6008, 'Bone Fracture'),
(7009, 5037, 6008, 'Joint Dislocation'),
(7010, 5145, 6009, 'Joint Dislocation'),
(7011, 5306, 6010, 'Muscle Strain');

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses  + 1, draws = draws
WHERE team_id = 4001;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4002;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4006;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4003;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4012;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4004;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5028;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5037;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5145;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5306;



INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6011, 3005, 4011, 4005, 'Sumeru', 6, 6, 2),
(6012, 3005, 4013, 4007, 'Fontaine', 21, 21, 2),
(6013, 3005, 4008, 4009, 'Inazuma', 13, 13, 2);

INSERT INTO teyvatleague.Injury (injury_id, player_id, match_id, inj_type)
VALUES
(7012, 5281, 6011, 'Bone Fracture'),
(7013, 5119, 6011, 'Joint Dislocation'),
(7014, 5334, 6012, 'Muscle Strain'),
(7015, 5172, 6012, 'Muscle Strain'),
(7016, 5217, 6013, 'Ligament Sprain'),
(7017, 5236, 6013, 'Bone Fracture');

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4011;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4005;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4013;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4007;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4008;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4009;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5281;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5119;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5334;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5172;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5217;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5236;


INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6014, 3006, 4010, 4014, 'Sumeru', 3, 24, 0);

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4010;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4014;


INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6015, 3007, 4001, 4012, 'Mondstadt', 1, 8, 0),
(6016, 3007, 4002, 4011, 'Mondstadt', 4, 18, 1);

INSERT INTO teyvatleague.Injury (injury_id, player_id, match_id, inj_type)
VALUES
(7018, 5281, 6016, 'Ligament Sprain');

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4001;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4012;

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4002;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4011;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5281;


INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6017, 3008, 4003, 4004, 'Shneznaya', 21, 20, 5),
(6018, 3008, 4006, 4005, 'Liyue', 4, 1, 0),
(6019, 3008, 4013, 4008, 'Fontaine', 4, 18, 1);

INSERT INTO teyvatleague.Injury (injury_id, player_id, match_id, inj_type)
VALUES
(7019, 5056, 6017, 'Concussion'),
(7020, 5064, 6017, 'Bone Fracture'),
(7021, 5086, 6017, 'Joint Dislocation'),
(7022, 5095, 6017, 'Ligament Sprain'),
(7023, 5095, 6017, 'Bone Fracture');

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4003;

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4004;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4006;

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4005;

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses + 1, draws = draws
WHERE team_id = 4013;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4008;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5056;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5064;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5086;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 2
WHERE player_id = 5095;



INSERT INTO teyvatleague.Matches (match_id, matchday_id, hometeam_id, awayteam_id, city , home_score, away_score, number_injuries)
VALUES
(6020, 3009, 4007, 4014, 'Inazuma', 2, 8, 0),
(6021, 3009, 4010, 4009, 'Sumeru', 15, 15, 3);

INSERT INTO teyvatleague.Injury (injury_id, player_id, match_id, inj_type)
VALUES
(7024, 5240, 6021, 'Muscle Strain'),
(7025, 5252, 6021, 'Muscle Strain'),
(7026, 5261, 6021, 'Ligament Sprain');

UPDATE teyvatleague.Team
SET league_points = league_points, wins = wins, losses = losses  + 1, draws = draws
WHERE team_id = 4007;

UPDATE teyvatleague.Team
SET league_points = league_points + 3, wins = wins + 1, losses = losses, draws = draws
WHERE team_id = 4014;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4010;

UPDATE teyvatleague.Team
SET league_points = league_points + 1, wins = wins, losses = losses, draws = draws + 1
WHERE team_id = 4009;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5240;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5252;

UPDATE teyvatleague.Player
SET total_injuries = total_injuries + 1
WHERE player_id = 5261;
