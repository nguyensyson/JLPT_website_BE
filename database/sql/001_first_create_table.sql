CREATE TABLE plans (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	duration_days INT,
	price DECIMAL(10, 2),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	phone VARCHAR(20),
	avatar_url VARCHAR(255),
	join_date DATE,
	last_active DATETIME,
	status ENUM('active', 'inactive') DEFAULT 'active',
	current_plan_id INT,
	FOREIGN KEY (current_plan_id) REFERENCES plans(id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE plan_history (
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	plan_id INT,
	start_date DATE,
	end_date DATE,
	status ENUM('active', 'expired'),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (plan_id) REFERENCES plans(id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE exam_levels (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE exam_years (
	id INT PRIMARY KEY AUTO_INCREMENT,
	year YEAR UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE exam_difficulties (
	id INT PRIMARY KEY AUTO_INCREMENT,
	label VARCHAR(20) UNIQUE,
	description VARCHAR(100),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE exams (
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255),
	level_id INT,
	year_id INT,
	difficulty_id INT,
	duration_minutes INT,
	description TEXT,
	FOREIGN KEY (level_id) REFERENCES exam_levels(id),
	FOREIGN KEY (year_id) REFERENCES exam_years(id),
	FOREIGN KEY (difficulty_id) REFERENCES exam_difficulties(id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE exam_sections (
	id INT PRIMARY KEY AUTO_INCREMENT,
	exam_id INT,
	name VARCHAR(100),
	time_limit_minutes INT,
	description TEXT,
	FOREIGN KEY (exam_id) REFERENCES exams(id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE questions (
	id INT PRIMARY KEY AUTO_INCREMENT,
	exam_id INT,
	section_id INT,
	question_text TEXT,
	explanation TEXT,
	FOREIGN KEY (exam_id) REFERENCES exams(id),
	FOREIGN KEY (section_id) REFERENCES exam_sections(id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE question_options (
	id INT PRIMARY KEY AUTO_INCREMENT,
	question_id INT,
	option_text VARCHAR(255),
	is_correct BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (question_id) REFERENCES questions(id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE exam_results (
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	exam_id INT,
	score INT,
	passed BOOLEAN,
	start_time DATETIME,
	end_time DATETIME,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (exam_id) REFERENCES exams(id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

CREATE TABLE exam_answers (
	id INT PRIMARY KEY AUTO_INCREMENT,
	result_id INT,
	question_id INT,
	selected_option_id INT,
	FOREIGN KEY (result_id) REFERENCES exam_results(id),
	FOREIGN KEY (question_id) REFERENCES questions(id),
	FOREIGN KEY (selected_option_id) REFERENCES question_options(id),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	created_by INT,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	updated_by INT,
	deleted_flag BOOLEAN DEFAULT FALSE
);

