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
app.MapGet("/people/{id}", async (Guid id) =>
{
    var conn = new SqlConnection(connStr);
    var person = new PersonWithParentsAndChildren();

    const string query1 = "SELECT * FROM Person WHERE Id=@Id";
    var people1 = await conn.QueryAsync<Person>(query1, new { Id = id });
    person.Person = people1.SingleOrDefault();

    const string query2 = @"SELECT * 
                            FROM Person
                            WHERE Id = (SELECT Father FROM Person WHERE Id = @Id)";
    var people2 = await conn.QueryAsync<Person>(query2, new { Id = id });
    person.Father = people2.SingleOrDefault();

    const string query3 = @"SELECT * 
                            FROM Person
                            WHERE Id = (SELECT Mother FROM Person WHERE Id = @Id)";
    var people3 = await conn.QueryAsync<Person>(query3, new { Id = id });
    person.Mother = people3.SingleOrDefault();

    const string query4 = @"SELECT *
                            FROM Person
                            WHERE Father = @Id OR Mother = @Id";
    var people4 = await conn.QueryAsync<Person>(query4, new { Id = id });
    person.Children = people4;

    return person;
});
app.UseStaticFiles();
app.Run();
