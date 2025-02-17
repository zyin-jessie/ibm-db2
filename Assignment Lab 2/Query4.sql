--JESSIE BARTOLOME
SELECT 
    ttd.TransDescription,
    cd.CompanyName,
    bpd.BPName,
    SUM(invf.ExtCost) AS TotalExtendedCost,
    COUNT(invf.InventoryKey) AS NumberOfTransactions
FROM 
    inventory_fact invf,
    trans_type_dim ttd,
    branch_plant_dim bpd,
    company_dim cd
WHERE 
    invf.TransTypeKey = ttd.TransTypeKey
    AND invf.BranchPlantKey = bpd.BranchPlantKey
    AND bpd.CompanyKey = cd.CompanyKey
GROUP BY 
    GROUPING SETS 
      ((ttd.TransDescription, cd.CompanyName, bpd.BPName),
      (ttd.TransDescription, cd.CompanyName),
      (ttd.TransDescription))
ORDER BY 
    ttd.TransDescription, cd.CompanyName, bpd.BPName;
