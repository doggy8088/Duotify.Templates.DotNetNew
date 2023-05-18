using WebApplication2.Models;
using Microsoft.EntityFrameworkCore;

public class EFUnitOfWork : IUnitOfWork
{
    public DbContext Context { get; set; }

    public EFUnitOfWork()
    {
        Context = new ContosoUniversityContext();
    }

    public void Commit()
    {
        Context.SaveChanges();
    }

    public string ConnectionString
    {
        get { return Context.Database.GetConnectionString(); }
        set { Context.Database.SetConnectionString(value); }
    }
}
