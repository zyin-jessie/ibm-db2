--JESSIE BARTOLOME
SELECT 
    dd.CalYear,
    dd.CalQuarter,
    cvd.Name AS CustomerName,
    SUM(invf.ExtCost) AS TotalExtendedCost,
    COUNT(invf.InventoryKey) AS NumberOfTransactions
FROM 
    inventory_fact invf,
    date_dim dd,
    cust_vendor_dim cvd,
    trans_type_dim ttd
WHERE 
    invf.DateKey = dd.DateKey
    AND invf.CustVendorKey = cvd.CustVendorKey
    AND invf.TransTypeKey = ttd.TransTypeKey
    AND ttd.TransTypeKey = 5
    AND dd.CalYear IN (2011, 2012)
GROUP BY 
    ROLLUP (dd.CalYear, dd.CalQuarter, cvd.Name);
