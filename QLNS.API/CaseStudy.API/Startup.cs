﻿using CaseStudy.BAL;
using CaseStudy.BAL.Interface;
using CaseStudy.DAL;
using CaseStudy.DAL.Interface;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CaseStudy.API
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
            services.AddMvc();

            services.AddTransient<INhanVienRepository, NhanVienRepository>();
            services.AddTransient<INhanVienService, NhanVienService>();

            services.AddTransient<IQuanLyRepository, QuanLyRepository>();
            services.AddTransient<IQuanLyService, QuanLyService>();

            services.AddTransient<INhanSuRepository, NhanSuRepository>();
            services.AddTransient<INhanSuService, NhanSuService>();

            services.AddTransient<ILoginService, LoginService>();
            services.AddTransient<ILoginRepository, LoginRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseMvc();
        }
    }
}
