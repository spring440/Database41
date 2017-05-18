CREATE PROC GetSpeakerInfo
AS
  SELECT Pe.first, Pe.last, Pe.email, Ad.address, Ad.city, Ad.zipcode, Ad.state
  FROM Presentations AS Pr
  INNER JOIN Presenters AS P
    ON Pr.presenter_id = P.id
  INNER JOIN Attendees AS A
    ON A.id = P.attendee_id
  INNER JOIN Courses AS C
    ON C.id = Pr.course_id
  INNER JOIN Persons AS Pe
    ON Pe.id = A.person_id
  INNER JOIN Addresses AS Ad
    ON Ad.id = Pe.address_id
  WHERE C.title = 'Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)'
GO
