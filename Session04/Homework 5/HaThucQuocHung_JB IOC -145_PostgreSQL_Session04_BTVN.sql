CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    position VARCHAR(50),
    salary DECIMAL(15, 2),
    bonus DECIMAL(15, 2),
    join_year INT
);

INSERT INTO employees (id, full_name, department, position, salary, bonus, join_year) VALUES
(1, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
(2, 'Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
(3, 'Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
(4, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
(5, 'Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
(6, 'Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
(7, 'Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);

-- Chuẩn hóa dữ liệu: Xóa các bản ghi trùng nhau hoàn toàn về tên, phòng ban và vị trí
select * from employees
select * from employees 
where id in (
	select id 
	from (
		select id, ROW_NUMBER() OVER (
			PARTITION BY full_name, department, position
			order by id
		) AS rn
		from employees
	) t
	where rn > 1
);
-- Cập nhật lương thưởng:
-- Tăng 10% lương cho những nhân viên làm trong phòng IT có mức lương dưới 18,000,000
-- Với nhân viên có bonus IS NULL, đặt giá trị bonus = 500000
update employees set salary = (salary*1.1) where department = 'IT' and salary < 18,000,000;
update employees set bonus = 500000 where bonus is null;

-- Truy vấn:
-- Hiển thị danh sách nhân viên thuộc phòng IT hoặc HR, gia nhập sau năm 2020, và có tổng thu nhập (salary + bonus) lớn hơn 15,000,000
-- Chỉ lấy 3 nhân viên đầu tiên sau khi sắp xếp giảm dần theo tổng thu nhập
SELECT *,
       salary + COALESCE(bonus, 0) AS total_income
FROM employees
WHERE (department = 'IT' OR department = 'HR')
  AND join_year > 2020
  AND (salary + COALESCE(bonus, 0)) > 15000000
ORDER BY total_income DESC
LIMIT 3;

-- Truy vấn theo mẫu tên: Tìm tất cả nhân viên có tên bắt đầu bằng “Nguyễn” hoặc kết thúc bằng “Hân”
SELECT *
FROM employees
WHERE full_name LIKE 'Nguyễn%'
   OR full_name LIKE '%Hân';

-- Truy vấn đặc biệt: Liệt kê các phòng ban duy nhất có ít nhất một nhân viên có bonus IS NOT NULL
SELECT DISTINCT department
FROM employees
WHERE bonus IS NOT NULL;

-- Khoảng thời gian làm việc: Hiển thị nhân viên gia nhập trong khoảng từ 2019 đến 2022 (BETWEEN)
SELECT *
FROM employees
WHERE join_year BETWEEN 2019 AND 2022;
