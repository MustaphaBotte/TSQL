-- Create Accounts Table
CREATE  TABLE   Accounts (
    AccountID INT PRIMARY KEY,
    Balance DECIMAL(10, 2)
);


-- Create Transactions Table
CREATE  TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    FromAccount INT,
    ToAccount INT,
    Amount DECIMAL(10, 2),
    Date DATETIME
);


-- Insert Sample Data into Accounts
INSERT INTO Accounts (AccountID, Balance) VALUES (1, 500.00); -- Account 1
INSERT INTO Accounts (AccountID, Balance) VALUES (2, 300.00); -- Account 2
