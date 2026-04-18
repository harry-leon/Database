CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE
);

INSERT INTO Employee (full_name, department, salary, hire_date)
VALUES
    ('Nguyen Van An', 'IT', 8500000, '2023-02-15'),
    ('Tran Thi Bich', 'HR', 7200000, '2022-11-20'),
    ('Le Hoang Nam', 'IT', 9500000, '2023-06-10'),
    ('Phan Minh Anh', 'Marketing', 5800000, '2024-01-05'),
    ('Doan Tuan Kiet', 'Finance', 6700000, '2023-09-12'),
    ('Vu Ngoc Lan', 'IT', 5400000, '2023-12-01');

-- Tang 10% luong cho nhan vien phong IT
UPDATE Employee
SET salary = salary * 1.10
WHERE department = 'IT';

-- Xoa nhan vien co muc luong duoi 6,000,000
DELETE FROM Employee
WHERE salary < 6000000;

-- Liet ke nhan vien co ten chua "An" khong phan biet hoa thuong
SELECT *
FROM Employee
WHERE full_name ILIKE '%An%';

-- Hien thi nhan vien co ngay vao lam trong nam 2023
SELECT *
FROM Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';

