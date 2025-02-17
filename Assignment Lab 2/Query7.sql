SELECT 
    cd.CompanyName,
    bpd.BPName,
    SUM(inf.ExtCost) AS TotalExtendedCost,
    SUM(inf.Quantity) AS TotalQuantity
FROM 
    inventory_fact inf,
    trans_type_dim ttd,
    branch_plant_dim bpd,
    company_dim cd
WHERE 
    inf.TransTypeKey = ttd.TransTypeKey
    AND inf.BranchPlantKey = bpd.BranchPlantKey
    AND bpd.CompanyKey = cd.CompanyKey
    AND ttd.TransTypeKey = 2
GROUP BY 
    cd.CompanyName, bpd.BPName

UNION ALL

SELECT 
    cd.CompanyName,
    NULL AS BPName,
    SUM(inf.ExtCost) AS TotalExtendedCost,
    SUM(inf.Quantity) AS TotalQuantity
FROM 
    inventory_fact inf,
    trans_type_dim ttd,
    branch_plant_dim bpd,
    company_dim cd
WHERE 
    inf.TransTypeKey = ttd.TransTypeKey
    AND inf.BranchPlantKey = bpd.BranchPlantKey
    AND bpd.CompanyKey = cd.CompanyKey
    AND ttd.TransTypeKey = 2
GROUP BY 
    cd.CompanyName

UNION ALL

SELECT 
    NULL AS CompanyName,
    NULL AS BPName,
    SUM(inf.ExtCost) AS TotalExtendedCost,
    SUM(inf.Quantity) AS TotalQuantity
FROM 
    inventory_fact inf,
    trans_type_dim ttd,
    branch_plant_dim bpd,
    company_dim cd
WHERE 
    inf.TransTypeKey = ttd.TransTypeKey
    AND inf.BranchPlantKey = bpd.BranchPlantKey
    AND bpd.CompanyKey = cd.CompanyKey
    AND ttd.TransTypeKey = 2
ORDER BY 
    CompanyName, BPName;
