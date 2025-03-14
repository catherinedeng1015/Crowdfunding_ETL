-- =======================================
-- CREATE THE DATABASE
-- =======================================
CREATE DATABASE crowdfunding_db;

-- =======================================
-- CREATE TABLES IN THE CORRECT ORDER
-- =======================================

-- Create the Category Table
CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY,  -- Unique identifier for categories 
    category VARCHAR(255)                 -- Category name 
);

-- Create the Subcategory Table
CREATE TABLE subcategory (
    subcategory_id VARCHAR(10) PRIMARY KEY,  -- Unique identifier for subcategories 
    subcategory VARCHAR(255),                -- Subcategory name 
);

-- Create the Contacts Table
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,  -- Unique contact ID
    first_name VARCHAR(100),        -- First name of the contact person
    last_name VARCHAR(100),         -- Last name of the contact person
    email VARCHAR(255) UNIQUE       -- Unique email address of the contact person
);

-- Create the Campaign Table
CREATE TABLE campaign (
    cf_id INT PRIMARY KEY,       -- Unique campaign ID 
    contact_id INT,
    company_name VARCHAR(255),      -- Name of the company running the campaign
    description VARCHAR,               -- Description of the campaign
    goal FLOAT,             -- Fundraising goal 
    pledged FLOAT,          -- Amount pledged by backers 
    outcome VARCHAR(50),            -- Outcome of the campaign (e.g., "successful", "failed")
    backers_count INT,              -- Number of backers supporting the campaign
    country VARCHAR(50),            -- Country where the campaign was launched
    currency VARCHAR(10),           -- Currency used for fundraising
    launch_date DATE,               -- Date when the campaign was launched
    end_date DATE,                  -- Date when the campaign ended
    category_id VARCHAR(10),
    subcategory_id VARCHAR(10)
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),                 -- Foreign key linking to the Contacts table
    FOREIGN KEY (category_id) REFERENCES category(category_id),        -- Foreign key linking to the Category table
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id),     -- Foreign key linking to the Subcategory table,
    
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY ("contact_id") REFERENCES "contacts" ("contact_id")
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY ("category_id") REFERENCES "contacts" ("category_id")
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY ("subcategory_id") REFERENCES "contacts" ("subcategory_id")


SELECT * FROM category
SELECT * FROM subcategory
SELECT * FROM contacts
SELECT * FROM campaign