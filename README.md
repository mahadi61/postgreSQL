## Question 1: 🎯 What is the purpose of a database schema in PostgreSQL?

PostgreSQL-এ একটি Database Schema হলো এমন একটি গঠন যা ডেটাবেসের টেবিল, ভিউ, ফাংশন, ইনডেক্স ইত্যাদি অবজেক্টগুলোকে গুছিয়ে ও সংগঠিতভাবে রাখে।

### 🔍 সহজ ভাষায়:

একটি Schema হলো একটি ফোল্ডার-এর মতো, যেখানে একই ধরণের বা সম্পর্কযুক্ত ডেটা রাখা হয়। এতে করে ডেটাবেস বড় হলেও তা সহজে ব্যবস্থাপনা করা যায়।

### 📌 Schema ব্যবহারের প্রধান উদ্দেশ্য:

✅ Organization:
সম্পর্কযুক্ত অবজেক্টগুলো একসাথে রাখে এবং গুছিয়ে রাখে।

✅ Avoid Name Conflicts:
আলাদা Schema-তে একই নামের টেবিল থাকতে পারে, কোনো সমস্যা হয় না।
যেমন: sales.customers এবং hr.customers — দুটো আলাদা।

✅ Access Control:
Schema অনুযায়ী অনুমতি (Permission) দেওয়া যায়, যা ডেটার নিরাপত্তা বাড়ায়।

✅ Multi-Tenancy Support:
একটি অ্যাপে আলাদা আলাদা ইউজার বা ক্লায়েন্টের ডেটা আলাদা Schema-তে রাখা যায়।

✅ Manageability:
ডেটাবেস ব্যাকআপ, ডেভেলপমেন্ট, এবং মাইগ্রেশনে সুবিধা হয়।

🧠 Example:

```
CREATE SCHEMA hr;

CREATE TABLE hr.employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) not null,
  department VARCHAR(50) not null,
);
```

এখানে hr হলো Schema এবং employees হলো সেই Schema-র মধ্যে থাকা একটি টেবিল।

## Question 2: Explain the Primary Key and Foreign Key concepts in PostgreSQL.

### 🔑 Primary Key in PostgreSQL

Primary Key হলো এমন একটি কলাম বা কলামগুলোর সমষ্টি যা একটি টেবিলের প্রতিটি সারিকে আলাদাভাবে শনাক্ত করে।

এতে থাকা মান অবশ্যই ইউনিক (অনন্য) হতে হবে।

এটি NULL গ্রহণ করে না।

প্রতিটি টেবিলে মাত্র একটি Primary Key থাকতে পারে।

Example:

```
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(50) not null,
);

```

এখানে student_id হলো Primary Key — প্রতিটি শিক্ষার্থীকে আলাদাভাবে চেনায়।

### 🔗 Foreign Key in PostgreSQL

Foreign Key হলো এমন একটি কলাম যা অন্য টেবিলের Primary Key-কে রেফার করে।

এটি দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি করে।

এটি ডেটার সঠিকতা ও সম্পর্ক নিশ্চিত করে। অর্থাৎ, Parent টেবিলে যে মান নেই তা Child টেবিলে রাখা যাবে না।

Example:

```
CREATE TABLE enrollments (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(student_id),
  course VARCHAR(50)
);

```

এখানে student_id হলো Foreign Key, যা students টেবিলের student_id-কে রেফার করে।

## Question 3: What is the difference between the VARCHAR and CHAR data types?

### 🔤 CHAR(n) – নির্দিষ্ট দৈর্ঘ্যের

এটি একটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে।

যদি ইনপুট n সংখ্যার চেয়ে ছোট হয়, তাহলে বাকি জায়গা স্পেস দিয়ে পূরণ করে।

নির্দিষ্ট দৈর্ঘ্যের ডেটার জন্য ভালো, যেমন: দেশের কোড BD, USA ইত্যাদি।

Example:

```
CHAR(5)

'Hi' দিলে এটি আসলে সংরক্ষণ করে: 'Hi   '

```

### 🔡 VARCHAR(n) – পরিবর্তনশীল দৈর্ঘ্যের

এটি বিভিন্ন দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে, কিন্তু সর্বোচ্চ n অক্ষর পর্যন্ত।

এটি কোনো স্পেস প্যাডিং করে না।

নাম, ইমেইল, ঠিকানা ইত্যাদির জন্য ভালো।
Example:

```
VARCHAR(5)

'Hi' দিলে এটি সংরক্ষণ করে: 'Hi'

```

## Question 4: Explain the purpose of the WHERE clause in a SELECT statement.

WHERE ক্লজ একটি SELECT স্টেটমেন্টে শর্ত (condition) প্রয়োগের জন্য ব্যবহৃত হয়।
এটি শুধু সেইসব রেকর্ড নির্বাচন করে যেগুলো নির্দিষ্ট শর্ত পূরণ করে।

### 🧠 সিনট্যাক্স (Syntax):

```
SELECT column1, column2
FROM table_name
WHERE condition;

```

উদাহরণ:

```
SELECT name, age
FROM students
WHERE age > 18;
```

✅ এই কুয়েরি শুধুমাত্র তাদের দেখাবে যাদের বয়স ১৮ বছরের বেশি।

## Question 5:Explain the GROUP BY clause and its role in aggregation operations.

### 🔹 GROUP BY কী?

GROUP BY ক্লজ PostgreSQL-এ এমন সারিগুলোকে একত্রিত করে যেগুলোর নির্দিষ্ট কলামে একই মান আছে।
এটি সাধারণত aggregate function (যেমন SUM(), AVG(), COUNT() ইত্যাদি)-এর সাথে ব্যবহৃত হয়।

### 🧠 কেন ব্যবহার করা হয়?

ডেটা দলভিত্তিক বিশ্লেষণ করতে।

যেমন: কোন প্রোডাক্ট কত বিক্রি হয়েছে, বিভাগভিত্তিক মোট আয় কত — এসব জানতে।

sales নামের একটি টেবিল:

| id  | product | quantity |
| --- | ------- | -------- |
| 1   | Apple   | 10       |
| 2   | Orange  | 5        |
| 3   | Apple   | 20       |
| 4   | Orange  | 15       |
| 5   | Banana  | 7        |

Example:

```
SELECT product, SUM(quantity)
FROM sales
GROUP BY product;
```

➡️ আউটপুট দেখাবে:

| product | sum |
| ------- | --- |
| Apple   | 30  |
| Orange  | 20  |
| Banana  | 7   |

এখানে GROUP BY product প্রতি প্রোডাক্ট অনুযায়ী গ্রুপ করেছে, আর SUM(quantity) প্রতিটি গ্রুপের মোট যোগফল দেখিয়েছে।
