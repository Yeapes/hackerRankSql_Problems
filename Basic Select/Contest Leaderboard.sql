SELECT h.hacker_id, h.name, SUM(t1.max_score) AS total_score
FROM (SELECT hacker_id, challenge_id, MAX(score) AS max_score
      FROM Submissions
      GROUP BY hacker_id, challenge_id) AS t1
INNER JOIN Hackers AS h
    ON t1.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.NAME
HAVING total_score > 0
ORDER BY total_score DESC, h.hacker_id