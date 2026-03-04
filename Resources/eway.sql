SELECT * FROM public.users ORDER BY id DESC;
SELECT * FROM finance.company ORDER BY id DESC;

SELECT * FROM finance.company_users ORDER BY user_id DESC;

SELECT * FROM finance.customer ORDER BY id DESC;
SELECT * FROM finance.vehicles ORDER BY id DESC;
SELECT * FROM finance.material ORDER BY id DESC;
SELECT * FROM finance.route_master ORDER BY id DESC;
SELECT * FROM finance.trips ORDER BY id DESC;
SELECT * FROM finance.material_trip_mapper ORDER BY id DESC;

SELECT * FROM finance.taxes ORDER BY id DESC;
SELECT * FROM finance.bill_master ORDER BY id DESC;
SELECT * FROM finance.bill_trip ORDER BY bill_master_id DESC;

SELECT * FROM finance.bill_master where id = 20;
SELECT * FROM finance.bill_trip where bill_master_id = 20;
SELECT * FROM finance.credit_note ORDER BY id DESC;

SELECT id, name, company_id FROM finance.customer 
WHERE company_id IS NOT NULL ORDER BY id DESC;

-- UPDATE finance.bill_master SET is_deleted = false WHERE is_deleted IS NULL;
