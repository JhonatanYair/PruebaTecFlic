using System.Text.Json.Serialization;
using AseoSasBackend.Models;
using AseoSasBackend.Repositories;
using AseoSasBackend.Services;
using log4net.Config;
using log4net;
using AseoSasBackend.InitialApi;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

string ASPNETCORE_ENVIRONMENT = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
string connectionString;
string connectionStringMaster;

if (ASPNETCORE_ENVIRONMENT == "Development")
{
    connectionString = builder.Configuration.GetConnectionString("cnAseoSasLocal");
    connectionStringMaster = builder.Configuration.GetConnectionString("cnMasterLocal");
}
else
{
    connectionString = builder.Configuration.GetConnectionString("cnAseoSasDocker");
    connectionStringMaster = builder.Configuration.GetConnectionString("cnMasterDocker");
}

var logRepository = LogManager.GetRepository(System.Reflection.Assembly.GetEntryAssembly());
XmlConfigurator.Configure(logRepository, new FileInfo("log4net.config"));
new HealthyBD(connectionString, connectionStringMaster).HealthyExecute();

builder.Logging.ClearProviders();
builder.Logging.AddLog4Net("log4net.config");

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSqlServer<AseoSasContext>(connectionString);
builder.Services.AddControllers().AddJsonOptions(x => x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);
builder.Services.AddScoped<IRepository<Productos>, Repository<Productos>>();
builder.Services.AddScoped<IRepository<Categorias>, Repository<Categorias>>();
builder.Services.AddScoped<IProductoService, ProductoService>();
builder.Services.AddScoped<ICategoriaService, CategoriaService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.Use((context, next) =>
{
    context.Request.Scheme = "https";
    return next();
});

app.UseAuthorization();

app.MapControllers();

app.Run();
