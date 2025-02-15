SELECT 
    dd.CalYear,
    dd.CalQuarter,
    cvd.Zip,
    cvd.Name,
    SUM(inf.ExtCost) AS TotalExtendedCost,
    COUNT(inf.InventoryKey) AS NumberOfTransactions
FROM 
    inventory_fact inf,
    date_dim dd,
    cust_vendor_dim cvd,
    trans_type_dim ttd
WHERE 
    inf.DateKey = dd.DateKey
    AND inf.CustVendorKey = cvd.CustVendorKey
    AND inf.TransTypeKey = ttd.TransTypeKey
    AND ttd.TransTypeKey = 5
    AND dd.CalYear IN (2011, 2012)
GROUP BY 
    ROLLUP (dd.CalYear, dd.CalQuarter, cvd.Zip, cvd.Name);
