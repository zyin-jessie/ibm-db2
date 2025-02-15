SELECT 
    dd.CalMonth,
    cvd.AddrCatCode1,
    SUM(invf.ExtCost) AS TotalExtendedCost,
    SUM(invf.Quantity) AS TotalQuantity
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
    AND dd.CalYear = 2011
GROUP BY 
    dd.CalMonth,
    cvd.AddrCatCode1
WITH ROLLUP;
