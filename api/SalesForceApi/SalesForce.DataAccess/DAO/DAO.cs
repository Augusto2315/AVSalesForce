using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
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


        internal virtual async Task<T> Save(T obj, bool saveChanges = false)
        {
            try
            {
                await DBContext.AddAsync(obj);
                if (saveChanges)
                {
                    await DBContext.SaveChangesAsync();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return obj;
        }

        internal async virtual Task<List<T>> Save(List<T> objs, bool saveChanges = true)
        {
            try
            {
                foreach (T obj in objs)
                {
                    await Save(obj);
                }
                if (saveChanges)
                {
                    await DBContext.SaveChangesAsync();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return objs;
        }

        internal async virtual void Delete(T obj)
        {
            try
            {
                DBContext.Remove(obj);
                await DBContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal virtual void DeleteList(List<T> objs)
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

        internal async virtual void DeleteAll(string tableName)
        {
            await DBContext.Database.ExecuteSqlRawAsync($"TRUNCATE TABLE {tableName}");
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


        public static string GetTableName(T t)
        {

            Type type = typeof(T);
            PropertyInfo[] propInfos
                = type.GetProperties(BindingFlags.Instance
                    | BindingFlags.Public
                    | BindingFlags.DeclaredOnly);
            return "";

            //return t.GetProperty("Table").GetValue(t).ToString();
        }

        public abstract Task<T> Update(T obj);
    }
}
