SELECT (art.artista) AS artista, (alb.album) AS album, COUNT(s.pessoa_usuaria_id) AS pessoas_seguidoras
FROM artistas AS art
INNER JOIN album AS alb
ON art.artista_id = alb.artista_id
INNER JOIN seguindo AS s
ON art.artista_id = s.artista_id
GROUP BY art.artista, alb.album
ORDER BY pessoas_seguidoras DESC, art.artista, alb.album;