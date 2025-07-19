# Simple Render Deployment (No Credit Card Required)

This guide shows how to deploy your meat website to Render without using Blueprint (which requires a credit card).

## 🚀 Step-by-Step Deployment

### Prerequisites
- Render account (free)
- MongoDB database (MongoDB Atlas free tier)
- Git repository with your code

### Step 1: Deploy Backend

1. **Go to [Render Dashboard](https://dashboard.render.com)**
2. **Click "New" → "Web Service"**
3. **Connect your Git repository**
4. **Configure the service:**
   ```
   Name: pons-meat-backend
   Root Directory: backend
   Environment: Node
   Build Command: npm install
   Start Command: npm start
   Plan: Free
   ```

5. **Add Environment Variables:**
   ```
   MONGO_URI: your-mongodb-connection-string
   JWT_SECRET: your-super-secret-jwt-key
   EMAIL_USER: your-email-username
   EMAIL_PASS: your-email-password
   NODE_ENV: production
   PORT: 10000
   ```

6. **Click "Create Web Service"**
7. **Wait for deployment and note the URL** (e.g., `https://pons-meat-backend.onrender.com`)

### Step 2: Deploy Frontend

1. **Go back to [Render Dashboard](https://dashboard.render.com)**
2. **Click "New" → "Static Site"**
3. **Connect your Git repository**
4. **Configure the service:**
   ```
   Name: pons-meat-frontend
   Root Directory: meat-website
   Build Command: npm install && npm run build
   Publish Directory: dist/meat-website
   Plan: Free
   ```

5. **Add Environment Variables:**
   ```
   NODE_ENV: production
   ```

6. **Click "Create Static Site"**
7. **Wait for deployment and note the URL** (e.g., `https://pons-meat-frontend.onrender.com`)

### Step 3: Update Configuration

After both services are deployed, you need to update the configuration:

#### Update Frontend Environment
Edit `meat-website/src/environments/environment.prod.ts`:
```typescript
export const environment = {
  production: true,
  apiUrl: 'https://YOUR_BACKEND_URL.onrender.com/api'
};
```

#### Update Backend CORS
Edit `backend/index.js`:
```javascript
const allowedOrigins = [
  "http://localhost:4200",
  "https://YOUR_FRONTEND_URL.onrender.com"
];
```

#### Redeploy Both Services
After making these changes:
1. Commit and push your changes to Git
2. Both services will automatically redeploy

### Step 4: Test Your Deployment

1. Visit your frontend URL
2. Test user registration/login
3. Test adding items to cart
4. Test the checkout process

## 🔧 Environment Variables Setup

### MongoDB Atlas Setup
1. Go to [MongoDB Atlas](https://cloud.mongodb.com)
2. Create a free cluster
3. Get your connection string
4. Replace `<password>` with your database password

### Email Service Setup
You can use:
- **Mailtrap** (for testing)
- **SendGrid** (free tier available)
- **Gmail** (with app passwords)

### JWT Secret
Generate a secure random string:
```bash
node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
```

## 🆘 Troubleshooting

### Common Issues:
1. **Build Failures**: Check the build logs in Render
2. **CORS Errors**: Make sure frontend URL is in backend CORS list
3. **Database Connection**: Verify MongoDB URI is correct
4. **Environment Variables**: Ensure all required variables are set

### Checking Logs:
- Go to your service in Render dashboard
- Click on the service name
- Go to "Logs" tab
- Check for any error messages

## ✅ Success Checklist

- [ ] Backend deployed successfully
- [ ] Frontend deployed successfully
- [ ] Environment variables configured
- [ ] CORS settings updated
- [ ] Database connection working
- [ ] User registration working
- [ ] Login functionality working
- [ ] Cart functionality working
- [ ] Checkout process working

## 💰 Cost

This deployment method is **completely free**:
- Render free tier: 750 hours/month
- MongoDB Atlas free tier: 512MB storage
- No credit card required 