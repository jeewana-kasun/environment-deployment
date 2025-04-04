using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;
using WebAPIWithMySQL.Models;
using Microsoft.EntityFrameworkCore;

namespace WebApplicationMySQL
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            var configuration = new ConfigurationBuilder()
                .SetBasePath(AppDomain.CurrentDomain.BaseDirectory)  // Set the base path to the current directory
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)  // Add JSON configuration file
                .Build();

            var host = configuration["DatabaseSettings:Host"];

            var port = configuration["DatabaseSettings:Port"];

            var user = configuration["DatabaseSettings:User"];

            var password = configuration["DatabaseSettings:Password"];

            var database = configuration["DatabaseSettings:Database"];

            services.AddDbContextPool<StudentDetailContext>(
                    options =>
                    {
                        options.UseMySql($"server={host};userid={user};pwd={password};"
                        + $"port={port};database={database}");
                    });
            services.AddControllersWithViews();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, StudentDetailContext context)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            context.Database.Migrate();
            app.UseRouting();

            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=StudentDetails}/{action=Index}/{id?}");
            });
        }
    }
}
