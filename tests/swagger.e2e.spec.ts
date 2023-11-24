import { test, expect } from '@playwright/test';

test('swagger ui  title', async ({ page }) => {
  await page.goto('http://localhost:5244/swagger/index.html');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Swagger UI/);
});