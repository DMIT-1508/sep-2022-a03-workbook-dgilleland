# Dan Gilleland

**Known Bugs:**

- *Fill in this list when you are finished your solution. Enter `No known bugs` if you have completed all the lab requirements successfully*

**Generate PDF from Markdown:**

1. Ensure you have the **Markdown PDF** extension to Visual Studio Code installed
1. Open your markdown document
1. Press `F1` to open the Command Palette in VS Code
1. Type `Markdown PDF: Export (pdf)` and press `Enter`

## Legend

This legend is a guide to reading and interpreting the table listings under 0NF through 3NF.

- **TableName:**
  - Table names will be bolded and end with a colon. (e.g.: `**TableName:**`)
- (Column, Names)
  - Column names for a table will be enclosed in (rounded parenthesis) (e.g.: `<span class="md">All, Attributes</span>`).
- <b class="pk">PrimaryKeyFields</b>
  - Primary key fields will be bold and inside a box. (e.g.: `<b class="pk">PrimaryKeyFields</b>`)
- <u class="fk">ForeignKeyFields</u>
  - Foreign key fields will be a wavy underline in italic and green. (e.g.: `<u class="fk">ForeignKeyFields</u>`)
- <b class="rg">Repeating Groups</b>
  - Groups of repeating fields will be identified in 0NF stage, and will be enclosed in orange curly braces. (e.g.: `<b class="rg">Repeating, Group, Fields</b>`)

----

> ***Your solution here***

## Customer Details View

### 0NF

After performing Zero-Normal Form, a single entity was identified: **Customer**

**Customer:** <span class="md"><b class="pk">CustomerNumber</b>, FirstName, LastName, Address, City, Province, PostalCode, HomePhone</span>

### 1NF - 3NF

No changes to the entity in 1NF through 3NF.

### ERD

![Customer View](./CustomerView.png)

----

## Customer Orders View

### 0NF

After performing Zero-Normal Form, a single entity was identified: **Order**

**Order:** <span class="md"><b class="pk">OrderNumber</b>, CustomerNumber, FirstName, LastName, Address, City, Province, PostalCode, Phone, Date, <b class="rg">ItemNumber, Description, Quantity, CurrentPrice, SellingPrice, Amount</b>, Subtotal, GST, Total</span>

### 1NF

After performing First-Normal Form, a new entity was identified: **OrderDetail**

**Order:** <span class="md"><b class="pk">OrderNumber</b>, CustomerNumber, FirstName, LastName, Address, City, Province, PostalCode, Phone, Date, Subtotal, GST, Total</span>

**OrderDetail:** <span class="md"><b class="pk"><u class="fk">OrderNumber</u>, ItemNumber</b>, Description, Quantity, CurrentPrice, SellingPrice, Amount</span>

### 2NF

After performing Second-Normal Form, another new entity was identified: **Item**

**OrderDetail:** <span class="md"><b class="pk"><u class="fk">OrderNumber</u>, <u class="fk">ItemNumber</u></b>, Quantity, SellingPrice, Amount</span>

**Item:** <span class="md"><b class="pk">ItemNumber</b>, Description CurrentPrice</span>

### 3NF

After performing Third-Normal Form, another new entity was generated: **Customer**

**Order:** <span class="md"><b class="pk">OrderNumber</b>, <u class="fk">CustomerNumber</u>, Date, Subtotal, GST, Total</span>

**Customer:** <span class="md"><b class="pk">CustomerNumber</b>, FirstName, LastName, Address, City, Province, PostalCode, Phone</span>

### ERD

![Customer Orders View](./CustomerOrdersView.png)

----

<style>
.md {
    display: inline-block;
    vertical-align: top;
    white-space:normal;
}
.md::before {
    content: '(';
    font-size: 1.25em;
    font-weight: bold;
}
.md::after {
    content: ')';
    font-size: 1.25em;
    font-weight: bold;
}
.pk {
    font-weight: 700;
    display: inline-block;
    border: thin solid #00f;
    padding: 0 2px;
    position: relative;
}
.pk::before {
    content: 'P';
    font-size:.55em;
    font-weight: bold;
    color: white;
    background-color: #72c4f7;
    position: absolute;
    left: -5px;
    top: -15px;
    border-radius: 50%;
    border: solid thin blue;
    width: 1.4em;
    height: 1.4em;
    padding:3px;
    text-align:center;
}
.fk {
    color: green;
    font-style: italic;
    text-decoration: wavy underline green;
    padding: 0 2px;
    position: relative;
}
.fk::before {
    content: 'F';
    font-size:.65em;
    position: absolute;
    left: -1px;
    bottom: -17px;
    color:darkgreen;
    background-color: #a7dea7;
    border-radius: 50%;
    border: dashed thin green;
    width: 1.4em;
    height: 1.4em;
    padding:3px;
    text-align:center;
}
.rg::before {
    content: '\007B';
    color: darkorange;
    font-size: 1.2em;
    font-weight: bold;
}
.rg::after {
    content: '\007D';
    color: darkorange;
    font-size: 1.2em;
    font-weight: bold;
}
.rg {
    display: inline-block;
    color: inherit;
    font-size: 1em;
    font-weight: normal;
}
.note {
    font-weight: bold;
    color: brown;
    font-size: 1.1em;
}
</style>
