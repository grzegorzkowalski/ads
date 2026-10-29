# Tools to install

## Required

### 1. Git

Install Git from <https://git-scm.com/downloads>.

Git is used to download the course and to keep your SQL work under version control.

### 2. Docker Desktop

Install Docker Desktop from <https://www.docker.com/products/docker-desktop/>.

- Windows: enable the WSL 2 backend when prompted.
- Linux: install Docker Engine and the Docker Compose plugin.
- macOS: confirm that your machine is Intel or use the remote-environment path described in [SETUP.md](../SETUP.md).

Verify the installation:

```text
docker --version
docker compose version
```

### 3. Visual Studio Code

Install VS Code from <https://code.visualstudio.com/>.

Install the Microsoft **mssql** extension from the Extensions view. The extension provides T-SQL syntax highlighting, IntelliSense, connection management, query execution, and result viewing.

### 4. Course repository

Clone or download this course repository. Open the `ads2026` folder as the VS Code workspace.

## Optional

### DataGrip

DataGrip is a full database IDE from JetBrains. It is useful for schema browsing, data editing, query consoles, and execution-plan work. Download it from <https://www.jetbrains.com/datagrip/download/>.

### Command-line tools

`sqlcmd` is optional. It is useful for automation, but the course can be completed entirely with VS Code or DataGrip.

## What you do not need

You do not need to install SQL Server locally, SQL Server Management Studio, MySQL, or MySQL Workbench for the standard course path. SQL Server is supplied by Docker.

