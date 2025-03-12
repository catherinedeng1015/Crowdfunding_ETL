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
    contact_id SERIAL PRIMARY KEY,  -- Unique contact ID
    first_name VARCHAR(100),        -- First name of the contact person
    last_name VARCHAR(100),         -- Last name of the contact person
    email VARCHAR(255) UNIQUE       -- Unique email address of the contact person
);

-- Create the Campaign Table
CREATE TABLE campaign (
    cf_id SERIAL PRIMARY KEY,       -- Unique campaign ID 
    contact_id INT,                 -- Foreign key linking to the Contacts table
    company_name VARCHAR(255),      -- Name of the company running the campaign
    description TEXT,               -- Description of the campaign
    goal DECIMAL(10,2),             -- Fundraising goal (stored as decimal)
    pledged DECIMAL(10,2),          -- Amount pledged by backers (stored as decimal)
    outcome VARCHAR(50),            -- Outcome of the campaign (e.g., "successful", "failed")
    backers_count INT,              -- Number of backers supporting the campaign
    country VARCHAR(50),            -- Country where the campaign was launched
    currency VARCHAR(10),           -- Currency used for fundraising
    launch_date DATE,               -- Date when the campaign was launched
    end_date DATE,                  -- Date when the campaign ended
    category_id VARCHAR(10),        -- Foreign key linking to the Category table
    subcategory_id VARCHAR(10),     -- Foreign key linking to the Subcategory table,
    
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE,
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id) ON DELETE CASCADE
);

