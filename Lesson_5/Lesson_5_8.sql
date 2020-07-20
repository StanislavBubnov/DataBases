CREATE TEMPORARY TABLE tbl (value INT)

INSERT INTO tbl VALUES
	(1),
	(2),
	(3),
	(4),
	(5)
	;
	
SELECT * FROM tbl;

SELECT exp(SUM(log(value))) AS product FROM tbl;