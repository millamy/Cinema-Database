# Cinema-Database
Simple Cinema database written in MSSQL

1. Purpose: The purpose of the designed database is to register movies and movie seances, store information about employees, cinema halls, customers and tickets sold.

2. Assumptions: a simple and functional structure enabling the storage and modification of selected data needed to operate the cinema
• The cinema has many permanent employees
• The number of cinema halls is fixed 
• Each cinema hall can have multiple employees
• A single ticket applies to one movie seance
• One movie can be created by many directors and producers
• Each movie has a pool of available and sold tickets
3. Capabilities:
• Inserting general data (about movies, employees, etc.)
• Inserting data on tickets sold
• Generate income reports
• Changing the number of tickets sold and remaining
• Searching for movie seances
• Searching for movies with specific attributes
• Salary increases for employees
4. Limitations:
• A single transaction includes tickets for one film screening only
• Archive tables have not been designed in the database
• Because the size of the tables is small, indexes have not been designed, but they may turn out to be useful as the database develops
• Due to limited knowledge about the functioning of this type of facility and having the desire to keep it simple and clear, tables or elements that could be necessary in practice may have been omitted.
