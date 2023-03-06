SELECT COUNT (r.pessoa_usuaria_id) AS musicas_no_historico
FROM reproducao AS r
WHERE r.pessoa_usuaria_id = 1;