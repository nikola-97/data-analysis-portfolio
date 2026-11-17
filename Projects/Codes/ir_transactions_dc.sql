# Look at the table [15.11.26]
SELECT * 
FROM iranian_transactions;

# Check how many unique values has the column status
SELECT DISTINCT status
FROM iranian_transactions; 		# success, succeed, fail, and failed

# Before starting to clean this dataset we should create a table, where we will insert the raw data.
# By doing so, we will always have the original setup of the raw data, in case we make a mistake.
# I accidently made more than one copy of the iranian_transactions.

CREATE TABLE ir_trans_copy1 
SELECT *
FROM iranian_transactions;

SELECT *
FROM ir_trans_copy1;		# Now we have a copy of the raw data

# I will be following these steps:
# The status column should have two unique values: success and fail
# Additionally, the time column will be split into date and time columns
# The columns card_type, and city have to be standardized

# For the data cleaning I will be using iran_trans_copy1, because I made a mistake in ir_trans_copy1

SET SQL_SAFE_UPDATES = 0; 		# Turn off the protection mode preventing UPDATE commands.
UPDATE iran_trans_copy1
SET status = LOWER(status);

# Check the table
SELECT *
FROM iran_trans_copy1;

# Instead of typing two updates for success and fail, we can use the CASE command:
UPDATE iran_trans_copy1
SET status = CASE
    WHEN status = 'succeed' THEN 'success'
    WHEN status = 'failed' THEN 'fail'
END
WHERE status IN ('succeed', 'failed');

SELECT DISTINCT status
FROM iran_trans_copy1;

# Check the card_type column
SELECT DISTINCT card_type
FROM iran_trans_copy1;

UPDATE iran_trans_copy1
SET card_type = 'Master Card'
WHERE card_type IN ('MastCard', 'Master-Card');

UPDATE iran_trans_copy1
SET card_type = 'Visa'
WHERE card_type = 'Vsa';

UPDATE iran_trans_copy1
SET card_type = 'unknown'
WHERE card_type = 'nan';

# Check the city column
SELECT DISTINCT city
FROM iran_trans_copy1;

UPDATE iran_trans_copy1
SET city = 'unknown'
WHERE city = 'nan';

UPDATE iran_trans_copy1
SET city = 'Tehran'
WHERE city IN ('THR', 'tehr@n', 'ThRan', 'TEHRAN');

UPDATE iran_trans_copy1
SET city = 'Karaj'
WHERE city = 'karaj';

# After running the SELECT DISTINCT command, there are two rows of Tehran
UPDATE iran_trans_copy1
SET city = TRIM(city);		# And this might be usually the solution.

SELECT DISTINCT city
FROM iran_trans_copy1;		# Now there is only one row called Tehran, as it should be.

# Check the updated table 
SELECT *
FROM iran_trans_copy1
ORDER BY id ASC;		# The id column is not functioning as a unique transaction key.

# Check how many unique IDs exist
SELECT COUNT(DISTINCT id)
FROM iran_trans_copy1;		# 99

# How often does an id appear
SELECT id, COUNT(*) AS id_count
FROM iran_trans_copy1
GROUP BY id
ORDER BY id_count DESC;

# Check if there are any duplicates, since the id does not function as a unique identifier:
SELECT status,
       time,
       card_type,
       city,
       amount,
       COUNT(*) AS columns_count
FROM iran_trans_copy1
GROUP BY status, time, card_type, city, amount
HAVING COUNT(*) > 1;

# Find out how many duplicates contains the dataset
SELECT COUNT(*)
FROM iran_trans_copy1;		# We have 10 000 rows

SELECT COUNT(*)
FROM (SELECT DISTINCT
        status,
        time,
        card_type,
        city,
        amount
    FROM iran_trans_copy1) AS x;	# But only 9 974 unique values => 26 duplicates

# So far, through the investigation of the id column we found out that the dataset contains duplicates.
# The id column will be removed and replaced with a real id identifier
# Before removing the duplicates, let's inspect one group:

SELECT *
FROM iran_trans_copy1
WHERE status = 'success'
  AND time = '2025-09-09 08:08:00'
  AND card_type = 'Discover'
  AND city = 'Tabriz'
  AND amount = 0;		# It shows again that duplicates exist.

# Add a column named row_num:
ALTER TABLE iran_trans_copy1
ADD COLUMN row_num INT AUTO_INCREMENT PRIMARY KEY;		# creates a permanent ID that is stored in the table

SELECT * 
FROM iran_trans_copy1;

# Assign row numbers within each duplicate group by using a window function
SELECT
    row_num,
    status,
    time,
    card_type,
    city,
    amount,
    ROW_NUMBER() OVER (
        PARTITION BY status, time, card_type, city, amount
        ORDER BY row_num) AS row_numb
FROM iran_trans_copy1;

# Check duplicates again before deleting
SELECT *
FROM (SELECT
        row_num,
        ROW_NUMBER() OVER (
            PARTITION BY status, time, card_type, city, amount
            ORDER BY row_num) AS row_numb
    FROM iran_trans_copy1
) x
WHERE row_numb > 1;

# Delete the duplicates
DELETE FROM iran_trans_copy1
WHERE row_num IN (
    SELECT row_num
    FROM (SELECT
		row_num,
		ROW_NUMBER() OVER (
			PARTITION BY status, time, card_type, city, amount
			ORDER BY row_num) AS row_numb
        FROM iran_trans_copy1) x
    WHERE row_numb > 1);

SELECT COUNT(*)
FROM iran_trans_copy1;		# The dataset has 9 974 rows now.

SELECT *
FROM iran_trans_copy1;

# I faced some difficulties here, because I accidentally wrote the names of the other tables.
# Therefore, remember to name the tables according to their functionality.
# Split the time column into two separate columns for date and time:
ALTER TABLE iran_trans_copy1
ADD COLUMN trans_date VARCHAR(10), 
ADD COLUMN trans_time VARCHAR(8);

UPDATE iran_trans_copy1
SET trans_date = LEFT(`time`, 10),
    trans_time = RIGHT(`time`, 8);

ALTER TABLE iran_trans_copy1
DROP COLUMN `time`;

SELECT *
FROM iran_trans_copy1;
  
ALTER TABLE iran_trans_copy1
MODIFY COLUMN trans_date DATE;

ALTER TABLE iran_trans_copy1
MODIFY COLUMN trans_time TIME;

SELECT *
FROM iran_trans_copy1;

# Let's create a new column 'trans_id' and delete the columns 'id' and 'row_num':
ALTER TABLE iran_trans_copy1
ADD COLUMN trans_id INT;

SET @trans_id = 0;

UPDATE iran_trans_copy1
SET trans_id = (@trans_id := @trans_id + 1);

# Check the result:
SELECT trans_id
FROM iran_trans_copy1
LIMIT 10;				# Correct

# A primary key must uniquely identify one and only one row, therefore it has to be NOT NULL:
ALTER TABLE iran_trans_copy1
MODIFY COLUMN trans_id INT NOT NULL;

SHOW KEYS
FROM iran_trans_copy1
WHERE Key_name = 'PRIMARY';		# row_num is a primary key

ALTER TABLE iran_trans_copy1
MODIFY COLUMN row_num INT NOT NULL;

ALTER TABLE iran_trans_copy1
DROP PRIMARY KEY,
ADD PRIMARY KEY (trans_id);		# Once assigned to a row, it should never change.

SELECT *
FROM iran_trans_copy1;

SHOW KEYS
FROM iran_trans_copy1
WHERE Key_name = 'PRIMARY';		# trans_id is the primary key and row_num can be dropped

ALTER TABLE iran_trans_copy1
DROP COLUMN id,
DROP COLUMN row_num;

SELECT *
FROM iran_trans_copy1;

# Look at amount
ALTER TABLE iran_trans_copy1
MODIFY COLUMN amount DECIMAL(15,2);		# Useful in financial contexts.

SELECT *
FROM iran_trans_copy1;

SELECT MIN(amount), MAX(amount)
FROM iran_trans_copy1;			# Since the currency is iranian Rial, extreme outliers are normal.