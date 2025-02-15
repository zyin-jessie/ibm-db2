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
    inf.DateKey = dd.DateKey  -- Connect inventory_fact to date_dim
    AND inf.CustVendorKey = cvd.CustVendorKey  -- Connect inventory_fact to cust_vendor_dim
    AND inf.TransTypeKey = ttd.TransTypeKey  -- Connect inventory_fact to trans_type_dim
    AND ttd.TransTypeKey = 5  -- Filter for shipments (transaction type 5)
    AND dd.CalYear IN (2011, 2012)  -- Filter for calendar years 2011 and 2012
GROUP BY 
    ROLLUP (dd.CalYear, dd.CalQuarter, cvd.Zip, cvd.Name);
