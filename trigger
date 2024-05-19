CREATE TABLE student_det (
    roll NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    dept VARCHAR2(100),
    sub1 NUMBER(3),
    sub2 NUMBER(3),
    sub3 NUMBER(3),
    total number(3)
);
CREATE OR REPLACE TRIGGER trg_stu
before insert on student_det
for each row
begin
:new.dept:=upper(:new.dept);
end;
insert into student_det(roll,name,dept,sub1,sub2,sub3) values(1,'swathi','cse',98,88,99);
select * from student_det;
create or replace trigger trg_tot
before insert on student_det
for each row
begin
:new.total:=:new.sub1+:new.sub2+:new.sub3;
end;
insert into student _det values(:new.roll,:new.name,:new.dept,:new.sub1,:new.sub2,:new.sub3,:new.total);
