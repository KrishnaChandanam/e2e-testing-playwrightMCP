# Intersport E2E Testing - Playwright

Comprehensive end-to-end testing suite for [Intersport.fi](https://www.intersport.fi) using Playwright and TypeScript.

## 🚀 Quick Start

### Installation
```bash
npm install
```

### Run Tests

**Headed mode** (see browser in action):
```bash
npm test -- --headed
```

**Headless mode** (faster, no browser window):
```bash
npm test
```

**Debug mode** (interactive debugging):
```bash
npm test -- --debug
```

**UI Mode** (interactive test explorer):
```bash
npm test -- --ui
```

### View Test Report
```bash
npm run report
```

## 📋 Test Coverage

The master test (`intersport-complete-master.spec.ts`) covers all major functionality:

### Phase 1️⃣: Homepage Navigation
- Search box functionality
- Cart button
- Login button
- Logo navigation
- Main navigation links

### Phase 2️⃣: Search & Filtering
- Product search
- Filter options
- Sort functionality

### Phase 3️⃣: Product Tiles & Cards
- Product card display
- Card links
- Product information (prices, images)

### Phase 4️⃣: Product Detail Page
- Product images/gallery
- Product title and price
- Size selection
- Add to cart button
- Save for later/Wishlist
- Share functionality
- Related products

### Phase 5️⃣: Category Navigation
- Navigate through categories
- Shoes, Clothing, Accessories

### Phase 6️⃣: Shopping Cart
- Cart page navigation
- Cart items display
- Quantity controls
- Remove items
- Total calculation
- Checkout button

### Phase 7️⃣: Footer & Links
- Footer sections (26 links, 11 sections)
- Social media links
- Payment methods
- Shipping information
- Newsletter subscription

### Phase 8️⃣: User Account
- Account/Login links
- Registration links
- Wishlist access
- Order history

## 🛠️ Configuration

### Playwright Config
- **Browser**: Chromium only
- **Test Directory**: `./tests`
- **Reporter**: HTML
- **Screenshots**: On failure only
- **Videos**: On failure only

### TypeScript Config
- **Target**: ES2020
- **Strict Mode**: Enabled
- **DOM Library**: Included

## 📁 Project Structure

```
E2ETest-PlayWrightMCP/
├── tests/
│   └── intersport-complete-master.spec.ts    # Main comprehensive test
├── playwright.config.ts                       # Playwright configuration
├── tsconfig.json                             # TypeScript configuration
├── package.json                              # Dependencies & scripts
└── README.md                                 # This file
```

## 📊 Test Metrics

- **Execution Time**: ~17 seconds
- **Browser**: Chromium
- **Elements Tested**: 50+
- **Phases**: 8 complete sections
- **Pages Visited**: 5+

## 🔧 Requirements

- Node.js 14+
- npm 6+
- Chromium browser (installed via Playwright)

## 📝 Notes

- Tests run on **Chromium only** for faster execution
- All tests include proper error handling
- Pop-up/cookie consent is handled automatically
- Clear console logging for each test phase
- Detailed failure screenshots and videos

## 🎯 Usage Example

```bash
# Run all tests
npm test

# Run with browser visible
npm test -- --headed

# Run specific test
npm test -- intersport-complete-master.spec.ts

# Generate and view report
npm test && npm run report
```

## 📚 Additional Resources

- [Playwright Documentation](https://playwright.dev)
- [Playwright Test Guide](https://playwright.dev/docs/intro)
- [Intersport.fi](https://www.intersport.fi)

---

**Created with Playwright & TypeScript** ✨
```

To:
```python
browser = p.chromium.launch(headless=True)
```

Then run:
```bash
python intersport_automation.py
```

## Expected Output

When you run the script, you should see:

```
============================================================
INTERSPORT AUTOMATION SCRIPT
============================================================

Step 1: Navigating to www.intersport.fi...
Step 2: Searching for 'men's running shoes'...
Step 3: Clicking on New Balance brand link...
Step 4: Clicking on New Balance Fresh Foam X 860v14 Wide product...
Step 5: Selecting size 43 / Wide...
Step 6: Adding product to cart...
Step 7: Verifying cart contents...
✓ Cart verification successful!
✓ Product: New Balance Fresh Foam X 860v14 Wide
✓ Size: 43 / Wide (Musta/Black)
✓ Price: 149,00€
✓ Quantity: 1
Step 8: Navigating to cart page...
Step 9: Exiting without checkout...
✓ Task completed successfully!
✓ Shopping cart contains: New Balance Fresh Foam X 860v14 Wide - 149,00€
✓ Browser closing without proceeding to checkout...

============================================================
SCRIPT COMPLETED SUCCESSFULLY!
============================================================
```

## Screenshots Generated

The script automatically saves two screenshots:
- `cart_confirmation.png` - Shows the "Product added to cart" confirmation dialog
- `cart_final.png` - Shows the final cart page with verified contents

## Script Details

### Key Selectors Used

- **Search Box**: `searchbox[name="Mitä etsit?"]` (What are you looking for?)
- **New Balance Brand Link**: First matching `New Balance` link
- **Product Link**: `New Balance Fresh Foam X 860v14 Wide - juoksukengät`
- **Size Option**: `43 / Wide`
- **Add to Cart Button**: `Lisää ostoskoriin`
- **Cart Link**: `tuotetta ostoskorissa` (items in cart)

### Product Selected

- **Brand**: New Balance
- **Model**: Fresh Foam X 860v14 Wide
- **Type**: Men's Running Shoes
- **Color**: Black (Musta)
- **Size**: 43 / Wide
- **Price**: 149.00€
- **Discount**: 14% off (Original: 175€)

## Troubleshooting

### Issue: "playwright module not found"
**Solution**: Install Playwright
```bash
pip install playwright
```

### Issue: Browsers not installed
**Solution**: Install Playwright browsers
```bash
playwright install
```

### Issue: Script times out
**Solution**: Increase the `time.sleep()` values in the script if your internet connection is slow:
```python
time.sleep(3)  # Instead of time.sleep(2)
```

### Issue: Elements not found
**Solution**: The website structure may have changed. Check if the selectors still exist by opening the website manually in your browser.

## Customization

You can modify the script to:
- Change the product being searched
- Select a different size
- Use different selectors
- Add more verification steps
- Capture additional data

## Notes

- The script uses the Finnish version of the website (intersport.fi/fi)
- All product names and buttons are in Finnish
- The script respects Intersport's website by including realistic delays
- No personal data is submitted (cart is not checked out)

## License

This script is provided as-is for educational and automation purposes.

## Support

If you encounter issues:
1. Check internet connectivity
2. Verify Playwright is installed: `playwright --version`
3. Try running in headless=False mode to see what's happening visually
4. Check if the website structure has changed
