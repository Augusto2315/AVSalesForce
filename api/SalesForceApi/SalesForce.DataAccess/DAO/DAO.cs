using System.Collections.Generic;
using System.Threading.Tasks;

public interface DAO<T>
{

    public void Save(T obeto);

    public Task Update(T obeto);
    public Task<List<T>> Get();

}