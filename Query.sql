--1.1 
SELECT ProductId 
		,pd.Name 
		,ProductNumber 
		,Size
		,color 
		,pd.ProductSubcategoryId
		,sc.Name AS SubCategory
FROM `adwentureworks_db.product` AS pd
JOIN `adwentureworks_db.productsubcategory` AS sc 
			ON pd.ProductSubcategoryID = sc.ProductSubcategoryID
ORDER BY sc.Name

--1.2 
SELECT ProductId
		,pd.Name
		,ProductNumber
		,Size
		,color
		,pd.ProductSubcategoryId
		,sc.Name AS SubCategory
		,pc.Name AS Category
FROM `adwentureworks_db.product` AS pd
JOIN `adwentureworks_db.productsubcategory` AS sc 
			ON pd.ProductSubcategoryID = sc.ProductSubcategoryID
JOIN `adwentureworks_db.productcategory` AS pc 
			ON pc.ProductCategoryID = sc.ProductCategoryID
ORDER BY pc.Name

--1.3
SELECT ProductId
		,pd.Name
		,ProductNumber
		,Size
		,color
		,pd.ProductSubcategoryId
		,sc.Name AS SubCategory
		,pc.Name AS Category
FROM `adwentureworks_db.product` AS pd
JOIN `adwentureworks_db.productsubcategory` AS sc 
			ON pd.ProductSubcategoryID = sc.ProductSubcategoryID
JOIN `adwentureworks_db.productcategory` AS pc 
			ON pc.ProductCategoryID = sc.ProductCategoryID
WHERE pc.Name = "Bikes" 
		AND pd.ListPrice > 2000 
		AND pd.SellEndDate IS NULL
ORDER BY pd.ListPrice DESC


--2.1
SELECT wor.LocationID
		,COUNT(DISTINCT(wor.WorkOrderID)) AS no_work_orders
		,COUNT(DISTINCT(wor.ProductID)) AS no_of_unique_products
		,SUM(wor.ActualCost) AS actual_cost
FROM `adwentureworks_db.workorderrouting` AS wor
WHERE wor.ActualStartDate BETWEEN '2004-01-01' AND '2004-01-31'
GROUP BY wor.LocationID
ORDER BY SUM(wor.ActualCost) DESC





SELECT wor.LocationID
		,COUNT(DISTINCT(wor.WorkOrderID)) AS no_work_orders
		,COUNT(DISTINCT(wor.ProductID)) AS no_of_unique_products
		,SUM(wor.ActualCost) AS actual_cost
FROM `adwentureworks_db.workorderrouting` AS wor
WHERE
  EXTRACT(year
  FROM
    ActualStartDate) = 2004
  AND EXTRACT(month
  FROM
    ActualStartDate) =1
GROUP BY wor.LocationID
ORDER BY SUM(wor.ActualCost) DESC 


--2.2
SELECT wor.LocationID
		,l.Name
		,COUNT(DISTINCT(wor.WorkOrderID)) AS no_work_orders
		,COUNT(DISTINCT(wor.ProductID)) AS no_of_unique_products
		,SUM(wor.ActualCost) AS actual_cost
		,ROUND(AVG(DATE_DIFF(ActualEndDate, ActualStartDate, DAY)),2) AS avg_days_diff
FROM `adwentureworks_db.workorderrouting` AS wor
JOIN `adwentureworks_db.location` AS l 
			ON wor.LocationID = l.LocationID
WHERE wor.ActualStartDate BETWEEN '2004-01-01' AND '2004-01-31'
GROUP BY wor.LocationID, l.Name
ORDER BY SUM(wor.ActualCost) DESC


--2.3
SELECT WorkOrderID
		,SUM(ActualCost) AS actual_cost
FROM `adwentureworks_db.workorderrouting`  
WHERE ActualStartDate BETWEEN '2004-01-01' AND '2004-01-31'
GROUP BY WorkOrderID
HAVING SUM(ActualCost) > 300

--3.1
SELECT soh.SalesOrderId
		,sod.OrderQty
		,sod.UnitPrice
		,sod.LineTotal
		,sod.ProductId
		,sod.SpecialOfferID
		,sod.ModifiedDate
		,spo.Category
		,spo.Description
FROM `adwentureworks_db.salesorderheader` AS soh
JOIN `tc-da-1.adwentureworks_db.salesorderdetail` AS sod 
			ON soh.SalesOrderID = sod.SalesOrderID
JOIN `tc-da-1.adwentureworks_db.specialoffer` as spo 
			ON sod.SpecialOfferID  = sod.SpecialOfferID
WHERE sod.SpecialOfferID <> 1 AND
		spo.description = "Volume Discount over 60" AND sod.OrderQty >= 60 OR
		spo.description = "Volume Discount 25 to 40" AND sod.OrderQty >= 25 AND sod.OrderQty <= 40 OR
		spo.description = "Volume Discount 15 to 24" AND sod.OrderQty >= 15 AND sod.OrderQty <= 24 OR
		spo.description = "Volume Discount 11 to 14" AND sod.OrderQty >= 11 AND sod.OrderQty <= 14 OR
		spo.description = "Volume Discount 41 to 60" AND sod.OrderQty >= 41 AND sod.OrderQty <= 60






SELECT sales_detail.SalesOrderId
		,sales_detail.OrderQty
		,sales_detail.UnitPrice
		,sales_detail.LineTotal
		,sales_detail.ProductId
		,sales_detail.SpecialOfferID
		,sales_detail.ModifiedDate
		,spec_offer.Category
		,spec_offer.Description
FROM `tc-da-1.adwentureworks_db.salesorderdetail`  as sales_detail

left join `tc-da-1.adwentureworks_db.specialofferproduct` as spec_offer_product
on sales_detail.productId = spec_offer_product.ProductID AND spec_offer_product.SpecialOfferID = sales_detail.SpecialOfferID

left join `tc-da-1.adwentureworks_db.specialoffer` as spec_offer
on sales_detail.SpecialOfferID = spec_offer.SpecialOfferID 





--3.2 
SELECT v.VendorId AS Id
		,vc.ContactId
		,vc.ContactTypeId 
		,v.Name
		,v.CreditRating 
		,v.ActiveFlag
		,va.AddressId
		,a.City
FROM `tc-da-1.adwentureworks_db.vendor` AS v
LEFT JOIN `tc-da-1.adwentureworks_db.vendorcontact` AS vc 
			ON v.VendorId = vc.VendorId 
LEFT JOIN `tc-da-1.adwentureworks_db.vendoraddress` AS va 
			ON v.VendorId = va.VendorId
LEFT JOIN `adwentureworks_db.address` AS a 
			ON a.AddressID = va.AddressID      










