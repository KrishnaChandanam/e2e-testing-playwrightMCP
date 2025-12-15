# Quick Reference - Docker & Jenkins Setup

## Files Created for You

1. **Dockerfile** - Builds your test container
2. **Jenkinsfile** - Defines your CI/CD pipeline
3. **docker-compose.yml** - Runs Jenkins locally
4. **.dockerignore** - Excludes unnecessary files
5. **SETUP_GUIDE.md** - Detailed setup instructions

---

## Current Status

✅ Docker image built: `intersport-tests:local` (4.66 GB)
✅ Jenkins running on: http://localhost:8080
✅ Ready for pipeline creation

---

## Quick Commands

```bash
# Get Jenkins password
docker logs jenkins-local | grep -A 5 "Please use the following password"

# View Jenkins
http://localhost:8080

# Check containers
docker ps

# View logs
docker logs -f jenkins-local

# Stop everything
docker-compose down

# Restart everything
docker-compose up -d
```

---

## Next Steps (One-by-One)

### Step 1: Get Jenkins Password
```bash
docker logs jenkins-local | grep -A 5 "Please use the following password"
```
Copy the password shown.

### Step 2: Open Jenkins
Open: **http://localhost:8080**

### Step 3: Login
- Username: `admin`
- Password: [paste from Step 1]

### Step 4: Create New Job
- Click "New Item"
- Name: `Intersport-E2E-Tests`
- Type: `Pipeline`
- Click OK

### Step 5: Configure Pipeline
Scroll to "Pipeline" section:
- **Definition**: Pipeline script from SCM
- **SCM**: Git
- **Repository URL**: `https://github.com/KrishnaChandanam/e2e-testing-playwrightMCP.git`
- **Branch**: `main`
- **Script Path**: `Jenkinsfile`
- Click **Save**

### Step 6: Run Tests
- Go to job page
- Click **"Build Now"**
- Watch console output
- Tests run in Docker!

---

## What's Happening Behind the Scenes

When you click "Build Now", Jenkins:
1. Gets your latest code from GitHub
2. Builds a Docker image
3. Runs the image as a container
4. Executes: `npm test`
5. Saves test reports

All inside Docker containers! 🐳

---

## Test Artifacts

After tests complete, you can find:
- **Test Results**: `test-results/` folder
- **HTML Report**: `playwright-report/index.html`
- **Screenshots**: `test-results/` (if tests failed)
- **Videos**: `test-results/` (if configured)

Jenkins archives these automatically!

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Jenkins won't start | `docker-compose logs jenkins` |
| Can't connect to http://localhost:8080 | Wait 30 seconds and refresh |
| Tests fail in Docker | Run `npm test` locally first to verify |
| Docker image too large | Playwright browsers = ~4GB, this is normal |
| Need new Jenkins password | Delete and restart: `docker-compose down && docker-compose up -d` |

---

## File Structure After Setup

```
E2ETest-PlayWrightMCP/
├── Dockerfile                 (New)
├── Jenkinsfile               (New)
├── docker-compose.yml        (New)
├── .dockerignore             (New)
├── SETUP_GUIDE.md            (New) ← Read this!
├── package.json              (Existing)
├── playwright.config.ts      (Existing)
├── tsconfig.json             (Existing)
├── README.md                 (Existing)
├── tests/
│   └── intersport-complete-master.spec.ts
├── playwright-report/
├── test-results/
└── ...other files
```

---

## Remember!

- Jenkins runs **locally** on your machine (http://localhost:8080)
- Your tests run in **Docker containers** (isolated, reproducible)
- Everything is **automated** (no manual test running needed)
- You can push changes to GitHub and Jenkins will run tests automatically

You're all set! 🎉

Read **SETUP_GUIDE.md** for detailed instructions.
