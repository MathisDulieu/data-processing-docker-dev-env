INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('01_valid_transactions.csv', 'text/csv',
        'reference,label,amount,currency,date,category
        REF001,Amazon purchase,49.99,EUR,2025-01-15,SHOPPING
        REF002,January salary,3000.00,EUR,2025-01-31,INCOME
        REF003,Netflix subscription,15.99,EUR,2025-01-05,ENTERTAINMENT
        REF004,Supermarket groceries,87.32,EUR,2025-01-20,FOOD
        REF005,January rent,850.00,EUR,2025-01-01,HOUSING'::bytea, 'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('02_valid_transactions.json', 'application/json',
        '[{"reference":"JSN001","label":"Incoming wire transfer","amount":500.00,"currency":"EUR","date":"2025-02-10","category":"INCOME"},{"reference":"JSN002","label":"Electricity bill","amount":112.50,"currency":"EUR","date":"2025-02-14","category":"UTILITIES"},{"reference":"JSN003","label":"Restaurant dinner","amount":43.80,"currency":"EUR","date":"2025-02-21","category":"FOOD"}]'::bytea,
        'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('03_mixed_valid_and_rejected.csv', 'text/csv',
        'reference,label,amount,currency,date,category
        REF010,Valid purchase,200.00,EUR,2025-03-01,SHOPPING
        REF011,Amount too high,9999999.99,EUR,2025-03-02,SHOPPING
        REF012,Another valid purchase,30.00,EUR,2025-03-03,FOOD
        REF013,Future date,50.00,EUR,2099-12-31,SHOPPING
        REF014,March salary,3000.00,EUR,2025-03-31,INCOME'::bytea, 'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('04_all_rejected.csv', 'text/csv',
        'reference,label,amount,currency,date,category
        ,Missing reference,100.00,EUR,2025-01-10,SHOPPING
        REF020,,150.00,EUR,2025-01-11,SHOPPING
        REF021,Missing amount,,EUR,2025-01-12,SHOPPING
        REF022,Missing currency,200.00,,2025-01-13,SHOPPING
        REF023,Missing date,250.00,EUR,,SHOPPING'::bytea, 'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('05_no_category.csv', 'text/csv',
        'reference,label,amount,currency,date,category
        REF030,Purchase without category,75.00,EUR,2025-04-10,
        REF031,Another without category,120.00,EUR,2025-04-11,
        REF032,One more without category,33.50,EUR,2025-04-12,'::bytea, 'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('06_negative_amounts.csv', 'text/csv',
        'reference,label,amount,currency,date,category
        REF040,Customer refund,-150.00,EUR,2025-05-01,REFUND
        REF041,Accounting correction,-0.01,EUR,2025-05-02,ADJUSTMENT
        REF042,Supplier credit note,-999999.99,EUR,2025-05-03,REFUND
        REF043,Amount below minimum,-1000001.00,EUR,2025-05-04,REFUND'::bytea, 'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('07_normalisation.csv', 'text/csv',
        'reference,label,amount,currency,date,category
        ref050,  Purchase with spaces  ,25.00,eur,2025-06-01,shopping
        ref051,Wire transfer,1000.00,usd,2025-06-02,income
        REF052,Already uppercase,500.00,EUR,2025-06-03,INCOME'::bytea, 'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('08_single_record.csv', 'text/csv',
        'reference,label,amount,currency,date,category
        REF060,Single transaction,42.00,EUR,2025-07-15,SHOPPING'::bytea, 'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('09_boundary_amounts.csv', 'text/csv',
        'reference,label,amount,currency,date,category
        REF070,Exact maximum,1000000.00,EUR,2025-08-01,INCOME
        REF071,Exact minimum,-1000000.00,EUR,2025-08-02,REFUND
        REF072,One cent above maximum,1000000.01,EUR,2025-08-03,INCOME
        REF073,One cent below minimum,-1000000.01,EUR,2025-08-04,REFUND'::bytea, 'PENDING');

INSERT INTO uploaded_files (filename, mime_type, content, status)
VALUES ('10_mixed_valid_and_rejected.json', 'application/json',
        '[{"reference":"JSN010","label":"Valid transaction","amount":250.00,"currency":"EUR","date":"2025-09-01","category":"SHOPPING"},{"reference":"JSN011","label":"Invalid future date","amount":100.00,"currency":"EUR","date":"2099-01-01","category":"SHOPPING"},{"reference":"","label":"Empty reference","amount":50.00,"currency":"EUR","date":"2025-09-03","category":"FOOD"},{"reference":"JSN013","label":"Amount out of range","amount":5000000.00,"currency":"EUR","date":"2025-09-04","category":"INCOME"},{"reference":"JSN014","label":"Valid without category","amount":75.00,"currency":"USD","date":"2025-09-05","category":null}]'::bytea,
        'PENDING');