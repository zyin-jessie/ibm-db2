SELECT 
    cd.CompanyName,
    bpd.BPName,
    SUM(invf.ExtCost) AS TotalExtendedCost,
    SUM(invf.Quantity) AS TotalQuantity
FROM 
    inventory_fact invf,
    trans_type_dim ttd,
    branch_plant_dim bpd,
    company_dim cd
WHERE 
    invf.TransTypeKey = ttd.TransTypeKey
    AND invf.BranchPlantKey = bpd.BranchPlantKey
    AND bpd.CompanyKey = cd.CompanyKey
    AND ttd.TransTypeKey = 2
GROUP BY 
    ROLLUP (cd.CompanyName, bpd.BPName);
