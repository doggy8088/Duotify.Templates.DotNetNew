namespace WebApplication2.Models
{
    public static class RepositoryHelper
    {
        public static IUnitOfWork GetUnitOfWork()
        {
            return new EFUnitOfWork();
        }

        // public static CourseRepository GetCourseRepository()
        // {
        //     var repository = new CourseRepository();
        //     repository.UnitOfWork = GetUnitOfWork();
        //     return repository;
        // }

        // public static CourseRepository GetCourseRepository(IUnitOfWork unitOfWork)
        // {
        //     var repository = new CourseRepository();
        //     repository.UnitOfWork = unitOfWork;
        //     return repository;
        // }
    }
}
