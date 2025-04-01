# How to Dockerize both ASP.NET Core 3.1 and MySQL Server in Windows containers?

## Introduction

This article shows how to use MySQL in a Windows Docker container communicating with an ASP.NET Core 3.1 web app running on the host computer.
First of all you have to know,

### What is Docker?
Docker is a set of platform as a service products that uses OS-level virtualization to deliver software in packages called containers.Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels

### What is ASP.NET Core?
ASP.NET Core is a free and open-source of web framework, and higher performance than ASP.NET, developed by Microsoft and the community. It is a modular framework that runs on both the full .NET Framework, on Windows, and the cross-platform .NET Core.

### What is MySQL?
MySQL is an open source relational database.MySQL is cross platform which means it runs on a number of different platforms such as Windows, Linux, and Mac OS etc.

## Dockerize both ASP.NET Core 3.1 and MySQL Server in Windows containers

This guide explains setting up a production-ready ASP.NET Core environment on Docker. Our Web Application can perform basic CRUD operations.

### In this article, you will learn how to

1. How to Set Up Docker in your Windows 10
2. Create a simple ASP.NET Core Web Appliction which do CRUD Operations using Entity Framework(with My SQL Server)
3. Created MySQL and ASP.NET Core Web Application container in Docker on Windows Container
4. Hosted both ASP.NET Core 3.1 and MySQL Server Container in Docker

### Required Tools

* Windows 10
* ASP.NET Core SDK 3.1
* Visual Studio
* VS Code
* Docker
### Step 1 . Install Docker in Windows 10
Docker Desktop for Windows is the Community version of Docker for Microsoft Windows. You can download Docker Desktop for Windows from Docker Hub.
[Download Link](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)
It is a big file of 916 MB.

After downloading that--> 
- Double-click `Docker Desktop Installer.exe` to run the installer.
![Docker Install File]()
- Follow the Install Wizard: accept the license, authorize the installer, and proceed with the install.Here is Ours' Configure File
- Click Finish to launch Docker.
- Docker starts automatically.
- Docker loads a “Welcome” window giving you tips and access to the Docker documentation

Docker Provides two Containers Linux and Windows . We will use Windows Container. We will use some experimental features. Experimental features are not ready for production. They are provided for test and evaluation in your sandbox environments. For that we will have to a little change in Docker. Fristly go to `Settings` --> `Docker Engine` --> `"experimental": true`

Our ``Docker`` is now Ready....!
