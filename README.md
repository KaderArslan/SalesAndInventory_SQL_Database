# Satış ve Stok Yönetim Sistemi Class Diagram'ın MSSQL de Veritabanını Oluşturma

### Senaryo
---
* Satış ve Envanter Yönetim Sistemi Sınıf Diyagramı, bir Satış ve Envanter Yönetim Sistemi sınıflarının yapısını, bunların niteliklerini, işlemlerini (veya yöntemlerini) ve nesneler arasındaki ilişkileri açıklar. 

* Satış ve Stok Yönetim Sisteminin ana sınıfları; Inventory (Stok), Customer (Müşteri), Sales (Satış), Payment (Ödeme), Supplier (Tedarikçi).

### Amaç
---
1. [Örnekte](https://www.freeprojectz.com/uml/sales-and-inventory-management-system-class-diagram "Satış ve Envanter Yönetim Sistemi Sınıf Diyagramı") verilen **Satış ve Stok Yönetim Sistemi Class Diagramına** göre MSSQL'de veri tabanını oluşturarak ilişkilerin oluşturulması amaçlanmaktadır.

1. Class Diyagram ve UML diyagram okuma alışkanlığı kazanmak, veri tabanı ilişkilerini kurabilmek.(Birincil anahtar, ikincil anahtar, auto increment vb...)

### Satış Sınıfları ve Envanter Yönetim Sistemi Sınıf Şeması:
---
* Inventory Class : Envanterin tüm işlemlerini yönetir,
* Customer Class : Müşterinin tüm operasyonlarını yönetir,
* Sales Class : Satışın tüm operasyonlarını yönetir,
* Payment Class : Ödemenin tüm işlemlerini yönetir,
* Supplier Class : Tedarikçinin tüm operasyonlarını yönetir.

### Satış ve Envanter Yönetim Sistemi Sınıf Diyagramının sınıfları ve nitelikleri:
---
* Inventory Attributes : inventory_id, inventory_items, inventory_number, inventory_type, inventory_description.
* Customer Attributes : customer_id, customer_name, customer_mobile, customer_email, customer_username, customer_password, customer_address.
* Sales Attributes : sales_id, sales_customer_id, sales_amount, sales_type, sales_description.
* Payment Attributes : payment_id, payment_customer_id, payment_date, payment_amount, payment_description.
* Supplier Attributes : supplier_id, supplier_name, supplier_mobile, supplier_email, supplier_username, supplier_password, supplier_address.

### Satış ve Stok Yönetim Sistemi Sınıf Diyagramı :
---
#### Class Diagram:
---
![Class Diagram](https://www.freeprojectz.com/sites/default/files/xSales,P20And,P20Inventory,P20Management,P20System_1.jpeg.pagespeed.ic.9IaDyKYk0e.webp)

### MSSQL'de Oluşturulan Veritabanı Sonucu Oluşan Database Diagramı:
---
![Database Diagramı](https://github.com/KaderArslan/SalesAndInventory_SQL_Database/blob/main/DatabaseDiagram.png)
