SELECT COUNT(DISTINCT c.cancoes) AS cancoes, COUNT(DISTINCT art.artista) AS artistas, COUNT(DISTINCT alb.album) AS albuns
FROM cancoes AS c
INNER JOIN artistas AS art
INNER JOIN album AS alb;