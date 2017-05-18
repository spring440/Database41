CREATE PROC insertPresentation

@name VARCHAR(255)='',
@presentation VARCHAR(255)=''
AS
BEGIN TRY
	DECLARE @indexOfSpace INT
	DECLARE @person_id INT
	DECLARE @presenter_id INT
  DECLARE @attendee_id INT
  DECLARE @course_id INT
	DECLARE @fName VARCHAR(255)
	DECLARE @lName VARCHAR(255)


	/*
	 grab first name and last name
	*/
	SET @indexOfSpace =  CHARINDEX(' ',@name)
	SET @fName = SUBSTRING(@name,0,@indexOfSpace)
	SET @lName = SUBSTRING(@name,@indexOfSpace+1,LEN(@name))
	/*
	 insert
	*/
	INSERT INTO Persons (first, last, email, address_id)
	VALUES (@fName,@lName, '', NULL)
	SET @person_id= (SELECT Persons.id FROM Persons
		WHERE Persons.first=@fName AND Persons.last=@lName)

  INSERT INTO Attendees (person_id, event_id)
  VALUES (@person_id, NULL )
  SET @attendee_id = (SELECT Attendees.id FROM Attendees
    WHERE Attendees.person_id=@person_id)

	INSERT INTO Presenters(attendee_id)
	VALUES (@attendee_id)
	SET @presenter_id= (SELECT Presenters.id FROM Presenters
		WHERE Presenters.attendee_id=@attendee_id)

  INSERT INTO Courses (title, description, duration, difficulty, track_id)
  VALUES (@presentation, '', 60, 'Beginner', NULL )
  SET @course_id = (SELECT Courses.id FROM Courses
    WHERE Courses.title = @presentation)

	INSERT INTO Presentations (presenter_id, course_id)
	VALUES (@presenter_id,@course_id)

END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage
END CATCH
GO

EXEC insertPresentation 'Yul Puma', 'SQLSaturday Database Los Angeles'

SELECT * FROM Persons WHERE Persons.first='Yul'