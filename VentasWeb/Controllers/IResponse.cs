namespace VentasWeb.Controllers
{
    public interface IResponse
    {
        string mensaje { get; set; }
        bool resultado { get; set; }
    }
}