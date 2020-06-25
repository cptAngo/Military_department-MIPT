drop table if exists lol;
create table lol(
num varchar
);

create or replace function select_prr() returns trigger as 
$$
declare
t character varying;
begin
if NEW.type = 'prr' then
update ars set status = 'activated';
end if;
return new;
end;
$$ language plpgsql;

drop trigger if exists Select_prr on target;
CREATE TRIGGER Select_prr after INSERT ON target FOR EACH ROW EXECUTE PROCEDURE select_prr();


insert into ars (status) values ('ad');
insert into target (type, x_rls1, y_rls1, x_rls2, y_rls2, x_rls3,y_rls3) values ('prr', 134, 1, 1, 1, 1, 1);