var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World!");
app.MapGet("/health", () => "A-OK!");

// Bind to public interface
app.Urls.Add("http://0.0.0.0:5000");

app.Run();
