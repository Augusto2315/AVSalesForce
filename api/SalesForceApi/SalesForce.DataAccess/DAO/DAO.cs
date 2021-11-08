using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalesForce.DataAcess
{
    public abstract class DAO<T>
    {

        internal virtual SalesForceDBContext DBContext { get; set; }


        public DAO(SalesForceDBContext dbContext)
        {
            DBContext = dbContext;
        }


        internal virtual void Save(T obj, bool saveChanges = false)
        {
            try
            {
                DBContext.Add(obj);
                if (saveChanges)
                {
                    DBContext.SaveChanges();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal virtual void Save(List<T> objs, bool saveChanges = true)
        {
            try
            {
                foreach (T obj in objs)
                {
                    Save(obj);
                }
                if (saveChanges)
                {
                    DBContext.SaveChanges();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal virtual void Delete(T obj)
        {
            try
            {


                DBContext.Remove(obj);
                DBContext.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }

        }

        internal virtual void Delete(List<T> objs)
        {
            try
            {
                foreach (T obj in objs)
                {
                    Delete(obj);
                }

            }
            catch (Exception)
            {
                throw;
            }
        }

#pragma warning disable CS0693 // Type parameter has the same name as the type parameter from outer type
        internal virtual async Task<List<T>> Get<T>()
#pragma warning restore CS0693 // Type parameter has the same name as the type parameter from outer type
        {
            try
            {
                return await DBContext.FindAsync<List<T>>();
            }
            catch (Exception)
            {
                throw;
            }
        }


        public abstract Task<T> Update(T obj);
    }
}
