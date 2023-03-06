SELECT (u.nome_pessoa_usuaria) AS pessoa_usuaria, 
COUNT (r.cancao_id) AS musicas_ouvidas, 
ROUND (SUM (c.duracao_segundos / 60), 2) AS total_minutos
FROM usuario AS u
INNER JOIN reproducao AS r ON u.pessoa_usuaria_id = r.pessoa_usuaria_id
INNER JOIN cancoes AS c ON r.cancao_id = c.cancao_id
GROUP BY u.nome_pessoa_usuaria
ORDER BY u.nome_pessoa_usuaria;