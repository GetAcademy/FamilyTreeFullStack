SELECT * 
FROM Person p1
JOIN Person p2 ON p1.Father = p2.Id
WHERE p1.Id = '22aefe0e-f6ba-11ec-b939-0242ac120002'

SELECT * 
FROM Person p1
LEFT JOIN Person p2 ON p1.Mother = p2.Id
WHERE p1.Id = '22aefe0e-f6ba-11ec-b939-0242ac120002'

--SELECT * 
--FROM Person
--WHERE Id = (SELECT Father FROM Person WHERE Id = '22aefe0e-f6ba-11ec-b939-0242ac120002')

SELECT * 
FROM Person
WHERE Father = '22aefe0e-f6ba-11ec-b939-0242ac120002' OR Mother = '22aefe0e-f6ba-11ec-b939-0242ac120002'