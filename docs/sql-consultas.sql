-- 1. Representantes que atendem um cliente
SELECT 
    r.*
FROM 
    representantes r
JOIN 
    representante_cidade rc ON rc.representante_id = r.id
JOIN 
    clientes c ON c.cidade_id = rc.cidade_id
WHERE 
    c.id = ?;

-- 2. Representantes de uma cidade
SELECT 
    r.*
FROM 
    representantes r
JOIN 
    representante_cidade rc ON rc.representante_id = r.id
WHERE 
    rc.cidade_id = ?;