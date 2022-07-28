-- QUESTÃO 1

SELECT users.id, users.name, cities.name as city 
FROM users JOIN cities 
ON users."cityId" = cities.id 
WHERE cities.name = 'Rio de Janeiro' 
ORDER BY users.id;


-- QUESTÃO 2

SELECT testimonials.id, u1.name as writer, u2.name as recipient, testimonials.message 
FROM testimonials 
JOIN users u1 
ON testimonials."writerId" = u1.id 
JOIN users u2 
ON testimonials."recipientId" = u2.id 
ORDER BY testimonials.id;


-- QUESTÃO 3

SELECT e."userId" as id, u.name, c.name as course, s.name as school, e."endDate" 
FROM educations e 
JOIN users u 
ON e."userId" = u.id 
JOIN courses c 
ON e."courseId" = c.id 
JOIN schools s 
ON e."schoolId" = s.id 
WHERE e.status = 'finished' AND e."userId" = 30;


-- QUESTÃO 4

SELECT e."userId" as id, u.name, r.name as role, c.name as company, e."startDate" 
FROM experiences e 
JOIN users u 
ON e."userId" = u.id 
JOIN roles r 
ON e."roleId" = r.id 
JOIN companies c 
ON e."companyId" = c.id 
WHERE e."userId" = 50 AND e."endDate" IS NULL;


-- BÔNUS

SELECT e."schoolId" as id, s.name as school, cou.name as course, com.name as company, r.name as role 
FROM jobs 
JOIN companies com 
ON jobs."companyId" = com.id 
JOIN roles r 
ON jobs."roleId" = r.id 
JOIN applicants a 
ON jobs.id = a."jobId" 
JOIN users u 
ON a."userId" = u.id 
JOIN educations e 
ON e."userId" = u.id 
JOIN schools s 
ON e."schoolId" = s.id 
JOIN courses cou 
ON e."courseId" = cou.id 
WHERE r.name = 'Software Engineer' AND com.id = 10 AND jobs.active;
