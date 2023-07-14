--  An SQL script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
-- Declare a variable to store the average
	DECLARE average_score DECIMAL(10, 2);
-- Assign the average of scores from the corrections table with the same user id as in the procedure parameter
	SELECT AVG(score) INTO average_score
	FROM corrections 
	WHERE corrections.user_id = user_id;
-- Update the users table with the stored average variabe.
	UPDATE users
	SET average_score = average_score
	WHERE id = user_id;
END $$
-- Redeclare the delimiter
DELIMITER ;
