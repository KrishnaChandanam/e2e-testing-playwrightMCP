# Intersport E2E Testing - Playwright

Simple end-to-end testing for [Intersport.fi](https://www.intersport.fi) using **Playwright**, **Docker**, and **Jenkins**.

---

## 🚀 Quick Start

### 1. Install Dependencies
```bash
npm install
```

### 2. Run Tests Locally (Headed Mode - See Browser)
```bash
npm test -- --headed
```

### 3. Run Tests Locally (Headless Mode - Fast)
```bash
npm test
```

### 4. View Test Report
```bash
npm run report
```

---

## 🐳 Docker & Jenkins Setup

### Build Docker Image
```bash
docker build -t intersport-tests:latest .
```

### Run Tests in Docker
```bash
docker run --rm intersport-tests:latest
```

### Start Jenkins Locally
```bash
docker-compose up -d
```

Jenkins will be available at: **http://localhost:8080**

---

## 📋 What Tests Do

The test covers these website features:

- ✅ Homepage navigation (search, cart, login)
- ✅ Search functionality (find products)
- ✅ Product browsing (tiles, cards, details)
- ✅ Category navigation (shoes, clothing, etc.)
- ✅ Shopping cart (add items, view cart)
- ✅ Footer links and sections
- ✅ User account buttons

---

## 🏗️ Architecture

```
Local Development
  └─ npm test (run tests locally)

Docker Container
  └─ Isolates tests & dependencies

Jenkins CI/CD
  └─ Automates test execution
```

---

## 📂 Project Files

```
.
├── Dockerfile                  # Docker image definition
├── docker-compose.yml          # Jenkins setup
├── Jenkinsfile                 # Jenkins pipeline (for reference)
├── playwright.config.ts        # Playwright configuration
├── package.json                # Dependencies
├── tsconfig.json               # TypeScript config
├── tests/
│   └── intersport-complete-master.spec.ts
└── README.md
```

---

## ✨ Key Features

- **Simple & Clean** - Easy to understand test structure
- **Dockerized** - Consistent environment anywhere
- **Jenkins Ready** - Automated CI/CD pipeline
- **Fast** - Tests complete in ~23 seconds
- **Reliable** - Handles dynamic content & waits

---

## 👨‍💻 Author

Created with Playwright, Docker, and Jenkins

## License

This script is provided as-is for educational and automation purposes.

## Support

If you encounter issues:
1. Check internet connectivity
2. Verify Playwright is installed: `playwright --version`
3. Try running in headless=False mode to see what's happening visually
4. Check if the website structure has changed
