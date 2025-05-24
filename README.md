# Answering-Business-Questions-with-SQL  
# AdventureWorks SQL Project: Product, Work Order, and Query Validation Tasks

## Dataset: `adwentureworks_db`

---

## 1. An Overview of Products

### 1.1 You have been asked to retrieve product data from the Product table, focusing only on products that have an associated Product Subcategory.

Make sure to include the following columns in your result: ProductId, Name, ProductNumber, Size, Color, ProductSubcategoryId, Product Subcategory Name

Order the results by Subcategory Name.

Note: The result hint provides a portion of the correct query result, which should match your final query results.

IMPORTANT. Think about the best SQL naming convention for naming columns. For example, using Snake Case (e.g., first_name, order_date) might be a good choice. Do not rely fully on the names provided in the hints. Remember, you can learn more about conventions by using ChatGPT, discussing in Standups, or using Open Sessions for more guidance.

Remember that you need to use the adwentureworks_db dataset, not the adventureworks_db_v19.

Result Hint:


Preview

---

### 1.2 Building on your 1.1 query, update it to include the Product Category Name in addition to the Product Subcategory.

Order the final results by Category Name.

Result Hint:


Preview

---

### 1.3 Using the existing query as a starting point, modify it to retrieve information about the most expensive bikes based on the following criteria:

Select bikes with a list price greater than 2000.  
Only include bikes that are actively sold (i.e., they do not have a Sales End Date).  
Order the results by List Price, from highest to lowest.

Result Hint:


Preview

---

## 2. Reviewing Work Orders

### 2.1 Create an aggregated query to analyze data from the WorkOrderRouting table for January 2004. Your query should:

Group the data by LocationId.  
For each LocationId, calculate and select:  
The total number of unique work orders.  
The total number of unique products.  
The sum of the actual cost.  

Result Hint:


Preview

---

### 2.2 Build on your 2.1 query by making the following updates:

Include the Location Name in your results.  
For each LocationId, calculate and include the average number of days between the Actual Start Date and the Actual End Date.  

Result Hint:


Preview

---

### 2.3 Write a query to retrieve all Work Orders from January 2004 where the Actual Cost is greater than 300.

Result Hint:


Preview

---

## 3. Query Validation

### 3.1 Your colleague has written a query to retrieve the list of orders linked to special offers. While the query runs without errors, the results seem incorrect, and the numbers do not match expectations.

Note: Everything in the SELECT statement works fine as it is, so try not to delete anything.

Review the query and investigate where the potential issue lies.

Query:

```sql
SELECT sales_detail.SalesOrderId
      ,sales_detail.OrderQty
      ,sales_detail.UnitPrice
      ,sales_detail.LineTotal
      ,sales_detail.ProductId
      ,sales_detail.SpecialOfferID
      ,spec_offer_product.ModifiedDate
      ,spec_offer.Category
      ,spec_offer.Description

FROM `tc-da-1.adwentureworks_db.salesorderdetail`  as sales_detail

left join `tc-da-1.adwentureworks_db.specialofferproduct` as spec_offer_product
on sales_detail.productId = spec_offer_product.ProductID

left join `tc-da-1.adwentureworks_db.specialoffer` as spec_offer
on sales_detail.SpecialOfferID = spec_offer.SpecialOfferID

order by LineTotal desc


### 3.2 Your colleague has written a query to retrieve basic Vendor information, but the query is not running correctly. Review the query to identify and fix any errors preventing it from running properly.Provide suggestions to improve its readability and make it easier to debug.

```SELECT  a.VendorId as Id,vendor_contact.ContactId, b.ContactTypeId,
        a.Name,
        a.CreditRating,
        a.ActiveFlag,
        c.AddressId,d.City

FROM `tc-da-1.adwentureworks_db.Vendor` as a

left join `tc-da-1.adwentureworks_db.vendorcontact` as vendor_contact
on vendor.VendorId = vendor_contact.VendorId
left join `tc-da1.adwentureworks_db.vendoraddress` as c on a.VendorId = c.VendorId

left join `tc-da-1.adwentureworks_db.address` as address
on vendor_address.VendorId = d.VendorId
