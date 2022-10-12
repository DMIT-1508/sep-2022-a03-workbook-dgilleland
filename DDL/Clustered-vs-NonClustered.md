# Clustered vs. Non-Clustered Indexes

Imagine a table like this, that has its data already sorted by the **Primary Key** (`SID`, short for "Student ID"). The PK is a **clustered index**.


| SID     | GivenName   | SurName
| :-------| :-----------| :---------
| 2000    | Stewart     | Dent
| 2005    | Crystal     | Clear
| 2010    | Len         | Der
| 2015    | Ken Tuck    | Ederby
| 2020    | Gary        | Montgomery
| 2025    | Allan       | Alder

Imagine wanted a *non*clustered index sorted by `SurName`.


| SurName   | SID 
| :-------  | :---
| Alder     | 2025
| Clear     | 2005     
| Dent      | 2000    
| Der       | 2010         
| Ederby    | 2015    
| Montgomery| 2020        
