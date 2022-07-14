-- crime scene
SELECT * FROM crime_scene_report
WHERE date = 20180115 AND type = 'murder' AND city = 'SQL City';

-- 1st witness information
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- 2nd witness information
SELECT * FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%Annabel%';

-- interview transcript
SELECT * FROM interview
WHERE person_id IN(14887, 16371);

-- gym data check
SELECT * FROM get_fit_now_member AS gm
JOIN get_fit_now_check_in AS gc 
ON gm.id = gc.membership_id
WHERE id LIKE '%48Z%'
AND membership_status = 'gold';

-- driver license table check
SELECT * FROM drivers_license
WHERE plate_number LIKE '%H42W%'
AND gender = 'male';

-- driver license match person
SELECT p.id, name, plate_number FROM drivers_license AS d
JOIN person AS p
ON d.id = p.license_id
WHERE license_id IN 
    (SELECT id FROM drivers_license
    WHERE plate_number LIKE '%H42W%'
    AND gender = 'male');

-- check the killer with solution table
INSERT INTO solution VALUES (1, "Jeremy Bowers");
SELECT * FROM solution;

-- interview with executioner
SELECT * FROM interview
WHERE person_id = 67318;

-- query to find mastermind
SELECT id, name FROM person
WHERE id = 
    (SELECT person_id FROM facebook_event_checkin
    WHERE event_name = 'SQL Symphony Concert'
        AND FLOOR(date/100) = 201712
        AND person_id IN 
        (SELECT person.id FROM person
            JOIN drivers_license
            ON person.license_id = drivers_license.id
            WHERE height BETWEEN 65 AND 67
                AND gender = 'female'
                AND hair_color = 'red'
                AND car_make = 'Tesla'
        )
    );

-- check mastermind to solution
INSERT INTO solution VALUES (1, "Miranda Priestly");
SELECT * FROM solution;