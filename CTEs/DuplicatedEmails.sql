


with DuplicatedEmails as
(
select Email ,Count(*)as DuplicationCount
from Contacts 
group by Email
having Count(*)>1
)

select Contacts.* from Contacts 
inner join DuplicatedEmails 
on Contacts.Email = DuplicatedEmails.Email











