# Insurance manager

## ** Problem definition **

 	Insurance Policy Management System -

Users will be able to maintain and see the insurance policies that they have purchased and will be able to see available insurers like - SBI Life Insurance, Alliance Bajaj, Kotak Mahindra, etc. and will also be able to write and view comments on policies.


To do this -

The user should be able to list / add / edit the company names like SBI Life, Aegon, Aviva, Bajaj Allianz, Bharti AXA, etc.


The user should be able to list / add / edit the details of clients / customers.


For each customer the user should be able to add / edit insurance policies and will also be able to list and view them.


Users should be able to add / edit / delete policy details like - customer, policy holder's name, nominee, sum insured (or sum assured) value, premium amount and commission / brokerage amount (if any), insurance company, maturity date.


Users should also be able to see a summarized view of the number of policies that have been purchased / surrendered / matured for a customer.


## ** Ruby and rails version **

	Version 3.8.2 (ruby 2.4.0-p0), codename: Sassy Salamander


## ** How to run the test suite **


 I have added some seeds to the project which might help in the evaluation process. I have added one admin account, one customer account, 2 companies and 2 insurance plans . Some parts of the project is visible to admins only, and any user Signing Up is made a customer by default. Only an admin may promote another user to admin, therefore it will be convenient to use the default admin account that I created with seeds.

admin account:
          login: admin@gmail.com
   password: password

customer account:
          login:user@gmail.com
   password: password



