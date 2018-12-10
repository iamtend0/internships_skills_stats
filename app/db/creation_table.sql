-- Création des tables relatives aux stages, entreprises et technologies
CREATE TABLE internships_techno (
id_internship_techno INT(5),
id_techno_internship INT(5),
PRIMARY KEY(id_internship_techno,id_techno_internship)
);

CREATE TABLE students (
id_student INT(5) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
firstname VARCHAR(100) NOT NULL
);

CREATE TABLE cat_technos (
id_category INT(3) PRIMARY KEY,
category VARCHAR(250) NOT NULL
);

CREATE TABLE companies (
id_company INT(5) PRIMARY KEY,
company VARCHAR(255) NOT NULL
);

CREATE TABLE internships (
id_internship INT(5) PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
link_pdf VARCHAR(255) NOT NULL,
author INT(5) NOT NULL,
company_fk INT(5) NOT NULL,
year_delivered VARCHAR(5),
CONSTRAINT FK_internship_techno FOREIGN KEY (id_internship) REFERENCES internships_techno(id_internship_techno),
CONSTRAINT FK_student FOREIGN KEY (author) REFERENCES students(id_student),
CONSTRAINT FK_company FOREIGN KEY (company_fk) REFERENCES companies(id_company)
);

CREATE TABLE technos (
id_techno INT(5) PRIMARY KEY,
category_fk INT(3),
name VARCHAR(200) NOT NULL,
CONSTRAINT FK_techno_internships FOREIGN KEY (id_techno) REFERENCES internships_techno(id_techno_internship),
CONSTRAINT FK_category FOREIGN KEY (category_fk) REFERENCES cat_technos(id_category)
);

