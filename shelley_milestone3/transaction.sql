-- Updates event revenue to appropriate data type --
ALTER TABLE `millennia-pavilion-db`.`postevents` MODIFY `event_revenue` DOUBLE(12,2);

START TRANSACTION;

INSERT INTO `millennia-pavilion-db`.`artists` (`artist_name`, `artist_hometown`, `artist_genre`)
VALUES  ('TCTG', 'Conway', 'Smooth Jazz'),
        ('The Kytes', 'Conway', 'American Folk'),
        ('Jack Solomon', 'Georgetown', 'Inde Rock'),
        ('Beach Man', 'Myrtle Beach', 'Raggae');

INSERT INTO `millennia-pavilion-db`.`events` (`event_date`, `event_time`, `event_name`)
VALUES  ('2024-04-20', '22:00', 'Par Four Jazz Bash'),
        ('2024-04-27', '20:00', 'Dedicated to Algorithms'),
        ('2024-05-04', '20:00', 'Desert Man vs. Beach Man'),
        ('2024-04-11', '15:00', "Beach Man's Celebration");

INSERT INTO `millennia-pavilion-db`.`customers` (`customer_firstname`, `customer_lastname`, `customer_email`, `customer_mailerlist`)
VALUES  ('Samuel', 'Shelley', 'sshell18@hgtc.edu', 0),
        ('Dennis', 'Quaid', 'osi@uni.com', 1),
        ('Regala', 'Schmegala', 'noone@gmail.com', 0),
        ('John', 'Doe', 'jdoe@yahoo.com', 1);

INSERT INTO `millennia-pavilion-db`.`eventcustomer` (`eventcustomer_viplevel`, `customer_id`, `event_id`)
VALUES  ('Diamond', 1, 1),
        ('Gold', 2, 2),
        ('Bronze', 3, 3),
        ('Silver', 4, 4);

INSERT INTO `millennia-pavilion-db`.`postevents` (`event_id`, `event_attendantscount`, `event_revenue`, `event_duration`)
VALUES  (1, 157, '3143.55', '04:34'),
        (2, 78, '936.72', '02:35'),
        (3, 382, '14134.88', '05:48'),
        (4, 191, '4775.93', '02:20');

INSERT INTO `millennia-pavilion-db`.`setlist` (`set_songname`, `set_artist`, `set_event`)
VALUES  ('I Just Really Love That Golf Stuff', 1, 1),
        ('American Puzzles', 2, 2),
        ('Rain Dance', 3, 3),
        ('Juju Bak at Yu', 4, 3),
        ('I Don Won', 4, 4);

COMMIT;

-- -- If error occurs Run below command --
-- ROLLBACK;