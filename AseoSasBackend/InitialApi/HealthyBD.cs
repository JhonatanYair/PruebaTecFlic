using AseoSasBackend.Models;
using log4net;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System.Diagnostics;

namespace AseoSasBackend.InitialApi
{
    public class HealthyBD
    {
        private AseoSasContext _context;
        private AseoSasContext _contextMaster;
        private BdRegistros bdRegistros;
        private readonly ILog _logger = LogManager.GetLogger(typeof(HealthyBD));

        public HealthyBD(string connectionString, string connectionStringMaster)
        {
            var dbContextOptions = new DbContextOptionsBuilder<AseoSasContext>().UseSqlServer(connectionString).Options;
            var dbContextOptionsMaster = new DbContextOptionsBuilder<AseoSasContext>().UseSqlServer(connectionStringMaster).Options;
            _context = new AseoSasContext(dbContextOptions);
            _contextMaster = new AseoSasContext(dbContextOptionsMaster);
            bdRegistros = new BdRegistros(_context);
        }

        public void HealthyExecute()
        {
            _logger.Debug("IN :: HealthyExecute();");

            // Crear un Stopwatch para medir el tiempo transcurrido
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            bool establishedConn = false;

            // Duración máxima en minutos
            int maxDurationMinutes = 8;
            TimeSpan maxDuration = TimeSpan.FromMinutes(maxDurationMinutes);

            while (stopwatch.Elapsed < maxDuration)
            {
                if (IsDatabaseConnected())
                {
                    establishedConn = true;
                    break;
                }
                _logger.Error("No se pudo establecer la conexión con la BD, se reteintará en 30 segundos.");
                Thread.Sleep(30000);
            }

            stopwatch.Stop();
            if (establishedConn)
            {
                _logger.Info("Se estableció la conexión con la BD correctamente.");
                //bdRegistros.CrearRegistrosInitial();
            }
            else
            {
                _logger.Error("No se pudo establecer la conexión con la BD. El api no funcionará.");
            }
            _logger.Debug("OUT :: HealthyExecute();");

        }

        private bool IsDatabaseConnected()
        {
            try
            {
                _context.Database.EnsureCreated();
                return _contextMaster.Database.CanConnect();
            }
            catch
            {
                return false;
            }
        }

    }
}
