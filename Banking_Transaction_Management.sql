create table account(act_no varchar2(10), act_name varchar2(10), act_balance number(10), act_dob date);
create table account_branch(act_no varchar2(10), act_name varchar2(10), act_branch varchar2(10));
create table account_city(act_no varchar2(10), act_name varchar2(10), act_city varchar2(10));

insert into account values('19KN1A0588','SIVAJI','35000',to_date('12-JUL-2001','DD-MM-YYYY'));
insert into account values('19KN1A0589','GANESH','30000',to_date('05-NOV-1993','DD-MM-YYYY'));
insert into account values('19KN1A0590','HEMANTH','55000',to_date('12-DEC-1997','DD-MM-YYYY'));
insert into account values('19KN1A0591','ANIL','46000',to_date('31-JAN-2000','DD-MM-YYYY'));
insert into account values('19KN1A0592','KIRAN','37900',to_date('27-FEB-2002','DD-MM-YYYY'));
insert into account values('19KN1A0593','VISWESH','35060',to_date('01-JUL-1998','DD-MM-YYYY'));
insert into account values('19KN1A0594','SAI','12070',to_date('17-SEP-2001','DD-MM-YYYY'));
insert into account values('19KN1A0595','DURGA','17800',to_date('14-JUN-1994','DD-MM-YYYY'));
insert into account values('19KN1A0596','KESHAV','65070',to_date('22-AUG-1995','DD-MM-YYYY'));
insert into account values('19KN1A0597','Shiv','35600',to_date('07-MAY-1999','DD-MM-YYYY'));


insert into account_branch values('19KN1A0588','SIVAJI','Manjalpur');
insert into account_branch values('19KN1A0589','GANESH','MG Road');
insert into account_branch values('19KN1A0590','HEMANTH','Mayapuri');
insert into account_branch values('19KN1A0591','ANIL','Borivali');
insert into account_branch values('19KN1A0592','KIRAN','Ghogha');
insert into account_branch values('19KN1A0593','VISWESH','Powai');
insert into account_branch values('19KN1A0594','SAI','Dum Dum');
insert into account_branch values('19KN1A0595','DURGA','Hinjewadi');
insert into account_branch values('19KN1A0596','KESHAV','Maninagar');
insert into account_branch values('19KN1A0597','Shiv','Gachibowli');


insert into account_city values('19KN1A0588','SIVAJI','Vadodara');
insert into account_city values('19KN1A0589','GANESH','Bangalore');
insert into account_city values('19KN1A0590','HEMANTH','Delhi');
insert into account_city values('19KN1A0591','ANIL','Mumbai');
insert into account_city values('19KN1A0592','KIRAN','Bhavnagar');
insert into account_city values('19KN1A0593','VISWESH','Mumbai');
insert into account_city values('19KN1A0594','SAI','Kolkata');
insert into account_city values('19KN1A0595','DURGA','Pune');
insert into account_city values('19KN1A0596','KESHAV','Ahmedabad');
insert into account_city values('19KN1A0597','Shiv','Hyderabad');



select * from account;
select * from account_branch;
select * from account_city;


DECLARE
xact_no account.act_no%type;
xact_balance account.act_balance%type;
opt number(1); 
deposit number(10);
withdrawal number(10);

BEGIN
xact_no:= :Enter_Account_Number;
opt:= :1Deposit_2Withdrawal_3Balance;  
select act_balance into xact_balance 
from account
where act_no=xact_no ; 
  
IF( opt = 1 ) THEN
deposit:= :Enter_Deposit_Amount;
update account
 set act_balance=act_balance+deposit
where act_no=xact_no ; 

xact_balance :=xact_balance +deposit;
dbms_output.put_line('Rs. '||deposit||' has been creadited in your account');
dbms_output.put_line('Your final balance is Rs. '||xact_balance );
                          
ELSIF( opt = 2 ) THEN 
withdrawal:= :Enter_Withdrawal_Amount;
    IF ( withdrawal<=xact_balance ) THEN
    update account
     set act_balance=act_balance-withdrawal
    where act_no=xact_no ;
    
    xact_balance:=xact_balance -withdrawal;
    dbms_output.put_line('Rs. '||withdrawal||' has been debited in your account');
    dbms_output.put_line('Your final balance is Rs.'||xact_balance );
    
    ELSE
    dbms_output.put_line('Your withdrawal amount is greater than balance');
    dbms_output.put_line('Your transaction failed');
    dbms_output.put_line('Your final balance is Rs.'||xact_balance ); 
    END IF;
ELSE
dbms_output.put_line('Your balance is Rs. '||xact_balance );
END IF;
    
  
END;