import pyodbc

try:
    # Establish the connection
    connection = pyodbc.connect(
        'DRIVER={SQL Server};'
        'SERVER=DESKTOP-I1VPS4S\SQLEXPRESS;'
        'DATABASE=Measurments;'
        'Trusted_Connection=yes;'
    )
    print("Connected to the database!")

    # Create a cursor object
    cursor = connection.cursor()

    # Define the query
    query = """
SELECT
    Station_code,

    CAST(Avg_SO2 AS VARCHAR(10)) + ' ' + 
    '[' + 
    CASE 
        WHEN Avg_SO2 < 0.02 THEN 'Good'
        WHEN Avg_SO2 BETWEEN 0.02 AND 0.05 THEN 'Normal'
        WHEN Avg_SO2 BETWEEN 0.05 AND 0.15 THEN 'Bad'
        ELSE 'Very Bad'
    END 
    + ']' AS Avg_SO2,

    CAST(Avg_NO2 AS VARCHAR(10)) + ' ' + 
    '[' + 
    CASE 
        WHEN Avg_NO2 < 0.03 THEN 'Good'
        WHEN Avg_NO2 BETWEEN 0.03 AND 0.06 THEN 'Normal'
        WHEN Avg_NO2 BETWEEN 0.06 AND 0.2 THEN 'Bad'
        ELSE 'Very Bad'
    END 
    + ']' AS Avg_NO2,

    CAST(Avg_O3 AS VARCHAR(10)) + ' ' + 
    '[' + 
    CASE 
        WHEN Avg_O3 < 0.03 THEN 'Good'
        WHEN Avg_O3 BETWEEN 0.03 AND 0.09 THEN 'Normal'
        WHEN Avg_O3 BETWEEN 0.09 AND 0.15 THEN 'Bad'
        ELSE 'Very Bad'
    END 
    + ']' AS Avg_O3,

    CAST(Avg_CO AS VARCHAR(10)) + ' ' + 
    '[' + 
    CASE 
        WHEN Avg_CO < 2 THEN 'Good'
        WHEN Avg_CO BETWEEN 2 AND 9 THEN 'Normal'
        WHEN Avg_CO BETWEEN 9 AND 15 THEN 'Bad'
        ELSE 'Very Bad'
    END 
    + ']' AS Avg_CO,

    CAST(Avg_PM10 AS VARCHAR(10)) + ' ' + 
    '[' + 
    CASE 
        WHEN Avg_PM10 < 30 THEN 'Good'
        WHEN Avg_PM10 BETWEEN 30 AND 80 THEN 'Normal'
        WHEN Avg_PM10 BETWEEN 80 AND 150 THEN 'Bad'
        ELSE 'Very Bad'
    END 
    + ']' AS Avg_PM10,

    CAST(Avg_PM25 AS VARCHAR(10)) + ' ' + 
    '[' + 
    CASE 
        WHEN Avg_PM25 < 15 THEN 'Good'
        WHEN Avg_PM25 BETWEEN 15 AND 35 THEN 'Normal'
        WHEN Avg_PM25 BETWEEN 35 AND 75 THEN 'Bad'
        ELSE 'Very Bad'
    END 
    + ']' AS Avg_PM25

FROM Measurement_summary;

    """

    # Execute the query
    cursor.execute(query)

    # Fetch all results
    rows = cursor.fetchall()

    # Print the results
    for row in rows:
        print(row)

except Exception as e:
    print(f"Failed to connect or execute query: {e}")

finally:
    # Close the cursor and connection
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals():
        connection.close()
