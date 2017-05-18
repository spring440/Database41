CREATE PROC budapestPresentation
AS
SELECT C.title, Pe.first, Pe.last, C.difficulty, L.location, E.date
FROM Tracks AS T
INNER JOIN Courses AS C
  ON C.track_id = T.id
INNER JOIN Presentations AS Pr
  ON Pr.course_id = C.id
INNER JOIN Presenters AS P
    ON Pr.presenter_id = P.id
INNER JOIN Attendees AS A
    ON A.id = P.attendee_id
INNER JOIN Persons AS Pe
    ON Pe.id = A.person_id
INNER JOIN Events AS E
  ON E.id = A.event_id
INNER JOIN Locations AS L
  ON L.id = E.location_id
GO
