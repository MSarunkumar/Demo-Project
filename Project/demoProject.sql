CREATE TABLE  ms_student(
  studentId int          NOT NULL IDENTITY (1, 1) PRIMARY KEY,
  Name      varchar(50)  NOT NULL,
  address   varchar(250) NOT NULL,
  phone     int          NOT NULL,
  dob       date         NOT NULL,
  email     varchar(50)  NOT NULL UNIQUE,
  password  char(32)     NOT NULL
  );

  CREATE TABLE  ms_admin(
  adminId   int          NOT NULL IDENTITY (1, 1) PRIMARY KEY,
  email     varchar(50)  NOT NULL UNIQUE,
  password  char(32)     NOT NULL
  );
  
  CREATE TABLE   ms_password(
  pid       int          NOT NULL IDENTITY (1, 1) PRIMARY KEY,
  email     varchar(50)  NOT NULL ,
  guids     char(36)     NOT  NULL,
  times     datetime     NOT NULL
  );

  CREATE TABLE   ms_question(
  questionId     int           NOT NULL IDENTITY (1, 1) PRIMARY KEY,
  question       varchar(900)  NOT NULL,
  option1        varchar(250)  NOT NULL,
  option2        varchar(250)  NOT NULL,
  option3        varchar(250)  NOT NULL,
  option4        varchar(250)  NOT NULL,
  answer         varchar(250)  NOT NULL
  );
  
  CREATE TABLE   ms_result(
  resultId       int           NOT NULL PRIMARY KEY,
  studentEmail   varchar(50)   NOT NULL ,
  startDate      datetime      NOT NULL,
  endDate        datetime      Default NULL, 
  score          int           default 0
  );


  

ALTER TABLE ms_student 
ALTER COLUMN phone bigint;

INSERT INTO ms_admin(email, password ,salt)
        VALUES('admin@gmail.com',
        '490278913DE54F1CB3C8021313DCBB6158006DE615F9B60BBE6E436DC3F2419B4048E8EB5D81C180BB3727BBC39A3C98D25E8FB5323D6A22C7E224DC9D280A0D ',
        '8AA3841D83AC124D1812A3DF8A6AF5B19452D9D63DB2B4F038E981637478C46BD600FD909BB8DA014031784606B6CE62570CF520C78F3BBC67CD1AF622EE0451');
   /* password [Admin@123]*/
        ALTER TABLE ms_question
ALTER COLUMN  answer INT;

ALTER TABLE ms_student
ADD salt char(128);

ALTER TABLE  ms_student
ALTER COLUMN password char(128);

ALTER TABLE  ms_admin
ALTER COLUMN password char(128);

ALTER TABLE ms_admin
ADD salt char(128);
