--1
CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

--2
ALTER TABLE people
ADD COLUMN department_id INT UNSIGNED NULL AFTER email;

--3
-- Q3 departments
INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

-- Q3 people
INSERT INTO people (name, email, department_id, age, gender) VALUES
('鈴木たかし', 'suzuki@example.com', 1, 25, 1),
('佐藤けんじ', 'sato@example.com', 1, 32, 1),
('高橋みさき', 'takahashi@example.com', 1, 28, 2),
('田中ゆうこ', 'tanaka@example.com', 2, 24, 2),
('伊藤しんじ', 'ito@example.com', 2, 41, 1),
('渡辺あや', 'watanabe@example.com', 2, 29, 2),
('中村ひろき', 'nakamura@example.com', 2, 35, 1),
('小林まい', 'kobayashi@example.com', 3, 30, 2),
('加藤ゆうすけ', 'kato@example.com', 4, 45, 1),
('吉田なおみ', 'yoshida@example.com', 5, 27, 2);

-- Q3 reports
INSERT INTO reports (person_id, content) VALUES
(1, '営業先を訪問して商談を行った'),
(2, '顧客からの問い合わせ対応を実施した'),
(3, '新規取引先への提案資料を作成した'),
(4, 'システム機能の実装を進めた'),
(5, 'テストケースを作成して確認した'),
(6, 'プログラムの不具合修正を行った'),
(7, '開発チームで進捗会議を実施した'),
(8, '経費精算の内容を確認して処理した'),
(9, '採用面接の日程調整を行った'),
(10, '社内システムの設定変更を実施した');

--4
UPDATE people
SET department_id = 1
WHERE department_id IS NULL;

--5
SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

--6
peopleテーブルからname、email、ageの3つのカラムを取得し、
department_idが1であるレコードだけを対象に、
created_atの昇順で並べて表示する。

--7
SELECT name
FROM people
WHERE
(age BETWEEN 20 AND 29 AND gender = 2)
OR
(age BETWEEN 40 AND 49 AND gender = 1);

--8
SELECT p.*
FROM people p
INNER JOIN departments d
USING (department_id)
WHERE d.name = '営業'
ORDER BY age;

--9
SELECT AVG(age) AS average_age
FROM people p
INNER JOIN departments d
USING (department_id)
WHERE d.name = '開発'
AND p.gender = 2;

--10
SELECT
    p.name,
    d.name,
    r.content
FROM people p
INNER JOIN departments d
USING (department_id)
INNER JOIN reports r
USING (person_id);

--11
SELECT p.name
FROM people p
LEFT OUTER JOIN reports r
USING (person_id)
WHERE r.report_id IS NULL;

