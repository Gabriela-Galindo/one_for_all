SELECT (u.nome_pessoa_usuaria) AS pessoa_usuaria, 
CASE WHEN MAX(r.data_reproducao) > '2020-12-31' THEN 'Ativa' ELSE 'Inativa' END AS status_pessoa_usuaria
FROM usuario AS u
INNER JOIN reproducao AS r
ON u.pessoa_usuaria_id = r.pessoa_usuaria_id
GROUP BY u.nome_pessoa_usuaria
ORDER BY u.nome_pessoa_usuaria;