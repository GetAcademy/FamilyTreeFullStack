using System.Data.SqlClient;
using Dapper;
using FamilyTree.Model;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
app.UseHttpsRedirection();
const string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FamilyTree;Integrated Security=True";
app.MapGet("/people", async () =>
{
    var conn = new SqlConnection(connStr);
    const string query = "SELECT * FROM Person";
    var people = await conn.QueryAsync<Person>(query);
    return people;
});
app.UseStaticFiles();
app.Run();
