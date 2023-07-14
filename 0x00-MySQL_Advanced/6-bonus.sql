-- An SQL script that creates a stored procedure AddBonus that adds a new correction for a student.
-- Change the delimiter
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
-- Declare the stored procedure
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
	-- Declare a variable to store the projects id.
	DECLARE project_id INT;
	-- If the project already exists, assign id from projects to project_id
	SELECT id INTO project_id FROM projects WHERE name = project_name;
	-- If it doesn't, create a new project in the projects table,
	IF project_id is NULL THEN
		INSERT INTO projects (name) VALUES (project_name);
		SET project_id = LAST_INSERT_ID();
	END IF;
	-- Update the corrections table
	INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END $$
-- Restore the delimiter
DELIMITER ;
