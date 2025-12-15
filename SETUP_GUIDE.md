# Containerized Playwright Tests with Jenkins - Setup Guide

## Overview
This guide walks through how your Playwright tests are now containerized and integrated with Jenkins for local automation.

---

## What We've Created

### 1. **Dockerfile** 
A Docker container that packages your Playwright tests with all dependencies:
- Node.js 18 base image
- Playwright browsers (Chrome, Firefox, WebKit)
- Your test files and configuration

### 2. **Jenkinsfile**
A CI/CD pipeline that defines how Jenkins runs your tests:
- **Checkout** - Gets your code from Git
- **Build Docker Image** - Creates the container
- **Run Tests** - Executes tests inside the container
- **Archive Results** - Saves test reports and artifacts

### 3. **docker-compose.yml**
Runs Jenkins locally with Docker integration, so Jenkins can build and run Docker containers

### 4. **.dockerignore**
Tells Docker which files to skip when building the image (keeps size smaller)

---

## Current Status

✅ **Jenkins is running locally!**

- **Jenkins URL**: http://localhost:8080
- **User**: admin
- **Password**: Check logs (see below)

---

## Step 5: Access Jenkins & Get Initial Password

Run this command to get Jenkins' initial admin password:

```bash
docker logs jenkins-local | grep -A 5 "Please use the following password"
```

Copy the password and go to: **http://localhost:8080**

Log in with:
- Username: `admin`
- Password: [from logs above]

---

## Step 6: Create a Jenkins Pipeline Job

Once logged in:

1. **Click "New Item"** (top-left)
2. **Enter Job Name**: `Intersport-E2E-Tests`
3. **Select**: `Pipeline`
4. **Click OK**

---

## Step 7: Configure the Pipeline

In the Pipeline section, do this:

```
Definition: Pipeline script from SCM
SCM: Git
Repository URL: https://github.com/KrishnaChandanam/e2e-testing-playwrightMCP.git
Branch: main
Script Path: Jenkinsfile
```

Then click **Save**

---

## Step 8: Run Your First Test

1. Go back to your job: **Intersport-E2E-Tests**
2. Click **"Build Now"** (left menu)
3. Watch the console output as Jenkins:
   - Checks out your code
   - Builds the Docker image
   - Runs tests inside the container
   - Archives results

---

## What Happens When Tests Run

**The Jenkinsfile pipeline does this:**

```
┌─────────────────────────────────────────┐
│  1. CHECKOUT CODE from GitHub           │
│     └─> Gets your latest tests           │
├─────────────────────────────────────────┤
│  2. BUILD DOCKER IMAGE                  │
│     └─> Creates `intersport-tests:XXX`  │
├─────────────────────────────────────────┤
│  3. RUN TESTS IN CONTAINER              │
│     └─> npm test (inside Docker)        │
├─────────────────────────────────────────┤
│  4. SAVE ARTIFACTS                      │
│     └─> test-results/ & reports/        │
└─────────────────────────────────────────┘
```

---

## File Locations & What They Do

| File | Purpose |
|------|---------|
| `Dockerfile` | Defines how to build the test container |
| `Jenkinsfile` | Defines the CI/CD pipeline stages |
| `docker-compose.yml` | Runs Jenkins locally |
| `.dockerignore` | Excludes files from Docker image |
| `playwright.config.ts` | Your Playwright test configuration |
| `package.json` | Node dependencies & scripts |

---

## Helpful Commands

**View Jenkins logs:**
```bash
docker logs -f jenkins-local
```

**Stop Jenkins:**
```bash
docker-compose down
```

**Restart Jenkins:**
```bash
docker-compose up -d
```

**View running containers:**
```bash
docker ps
```

**Rebuild your test image:**
```bash
docker build -t intersport-tests:latest .
```

**Run tests manually (without Jenkins):**
```bash
docker run --rm -it intersport-tests:local npm test
```

---

## Next Steps

1. **Access Jenkins**: http://localhost:8080
2. **Get password**: Check logs (command above)
3. **Create pipeline job** (follow Step 6-7 above)
4. **Click "Build Now"** to run tests
5. **View reports** in Jenkins after tests complete

---

## Troubleshooting

**Jenkins won't start?**
```bash
docker-compose logs jenkins
```

**Tests failing in Docker?**
Test locally first:
```bash
npm test
```

**Docker image too large?**
The Playwright browsers are ~4GB - this is normal.

**Want to see test results?**
Check the `playwright-report/` folder after tests run.

---

## Architecture Summary

```
Your Local Machine
    │
    ├── Jenkins (Port 8080)
    │   └── Runs Jenkinsfile pipeline
    │       │
    │       └── Builds Docker Image
    │           │
    │           └── Runs Test Container
    │               └── Executes: npm test
    │                   └── Outputs: test-results/, playwright-report/
    │
    └── Docker Engine
        └── Manages containers & images
```

---

## Key Concepts Explained

**Containerization**: Your tests + all dependencies packaged in a portable box (Docker image)

**Jenkins**: Automation server that watches your Git repo and runs the pipeline automatically

**Pipeline**: Step-by-step process (checkout → build → test → report)

**Artifacts**: Test results saved by Jenkins so you can view them later

**Docker Compose**: Tool to manage multiple Docker containers easily

---

Enjoy your fully automated E2E testing pipeline! 🎉
