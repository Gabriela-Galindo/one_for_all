SELECT (art.artista) AS artista, (alb.album) AS album 
FROM artistas AS art
INNER JOIN album AS alb
ON art.artista_id = alb.artista_id
WHERE art.artista = 'Elis Regina'
ORDER BY alb.album;
