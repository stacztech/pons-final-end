# Deployment Guide for Pons Meat Website

This guide will help you deploy your meat website to Render.

## Prerequisites

1. A Render account (free tier available)
2. A MongoDB database (MongoDB Atlas free tier recommended)
3. Your code pushed to a Git repository (GitHub, GitLab, etc.)

## Step 1: Prepare Your Environment Variables

You'll need to set up the following environment variables in Render:

### Backend Environment Variables:
- `MONGO_URI`: Your MongoDB connection string
- `JWT_SECRET`: A secure random string for JWT token signing
- `EMAIL_USER`: Your email service username
- `EMAIL_PASS`: Your email service password
- `NODE_ENV`: Set to "production"
- `PORT`: Set to "10000"

### Frontend Environment Variables:
- `NODE_ENV`: Set to "production"

## Step 2: Deploy to Render

### Option 1: Using render.yaml (Recommended)

1. Push your code to a Git repository
2. Go to [Render Dashboard](https://dashboard.render.com)
3. Click "New" → "Blueprint"
4. Connect your Git repository
5. Render will automatically detect the `render.yaml` file and create both services

### Option 2: Manual Deployment

#### Deploy Backend:
1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click "New" → "Web Service"
3. Connect your Git repository
4. Configure the service:
   - **Name**: `pons-meat-backend`
   - **Root Directory**: `backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
5. Add environment variables (see Step 1)
6. Click "Create Web Service"

#### Deploy Frontend:
1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click "New" → "Static Site"
3. Connect your Git repository
4. Configure the service:
   - **Name**: `pons-meat-frontend`
   - **Root Directory**: `meat-website`
   - **Build Command**: `npm install && npm run build`
   - **Publish Directory**: `dist/meat-website`
5. Add environment variables (see Step 1)
6. Click "Create Static Site"

## Step 3: Update Frontend API URL

After deployment, you'll need to update the frontend environment file with your actual backend URL:

1. Go to your frontend service in Render
2. Note the URL (e.g., `https://pons-meat-backend.onrender.com`)
3. Update `meat-website/src/environments/environment.prod.ts`:
   ```typescript
   export const environment = {
     production: true,
     apiUrl: 'https://YOUR_BACKEND_URL.onrender.com/api'
   };
   ```
4. Redeploy the frontend

## Step 4: Configure CORS

Update the backend CORS configuration in `backend/index.js` to allow your frontend domain:

```javascript
const allowedOrigins = [
  "http://localhost:4200",
  "https://YOUR_FRONTEND_URL.onrender.com"
];
```

## Step 5: Test Your Deployment

1. Visit your frontend URL
2. Test user registration/login
3. Test adding items to cart
4. Test the checkout process
5. Test admin functionality

## Troubleshooting

### Common Issues:

1. **CORS Errors**: Make sure your frontend URL is added to the allowed origins in the backend
2. **Database Connection**: Verify your MongoDB URI is correct and the database is accessible
3. **Build Failures**: Check the build logs in Render for any missing dependencies
4. **Environment Variables**: Ensure all required environment variables are set in Render

### Logs:
- Check the logs in your Render dashboard for both services
- Backend logs will show API requests and errors
- Frontend build logs will show any compilation issues

## Support

If you encounter issues:
1. Check the Render documentation
2. Review the logs in your Render dashboard
3. Verify all environment variables are set correctly
4. Ensure your MongoDB database is running and accessible 