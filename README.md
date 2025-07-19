# Pons Meat Website

A full-stack meat ordering website built with Angular frontend and Node.js backend.

## 🚀 Quick Deploy to Render

### Prerequisites
- Git repository (GitHub, GitLab, etc.)
- MongoDB database (MongoDB Atlas recommended)
- Render account

### One-Click Deployment
1. Push your code to a Git repository
2. Go to [Render Dashboard](https://dashboard.render.com)
3. Click "New" → "Blueprint"
4. Connect your Git repository
5. Set up environment variables (see below)
6. Deploy!

## 📋 Environment Variables

### Backend (Required)
- `MONGO_URI`: MongoDB connection string
- `JWT_SECRET`: Secure random string for JWT tokens
- `EMAIL_USER`: Email service username
- `EMAIL_PASS`: Email service password
- `NODE_ENV`: Set to "production"
- `PORT`: Set to "10000"

### Frontend (Required)
- `NODE_ENV`: Set to "production"

## 🏗️ Project Structure

```
pons-final-end/
├── backend/                 # Node.js API server
│   ├── controllers/        # API controllers
│   ├── models/            # MongoDB models
│   ├── routes/            # API routes
│   ├── middleware/        # Express middleware
│   └── index.js           # Server entry point
├── meat-website/          # Angular frontend
│   ├── src/
│   │   ├── app/
│   │   │   ├── components/ # Angular components
│   │   │   └── services/   # API services
│   │   └── environments/   # Environment configs
│   └── package.json
├── render.yaml            # Render deployment config
└── DEPLOYMENT.md          # Detailed deployment guide
```

## 🛠️ Local Development

### Backend
```bash
cd backend
npm install
npm run dev
```

### Frontend
```bash
cd meat-website
npm install
npm start
```

## 📚 Features

- User authentication (login/register)
- Product catalog with categories
- Shopping cart functionality
- Order management
- Admin panel
- Address management
- Email notifications

## 🔧 Technologies Used

### Backend
- Node.js
- Express.js
- MongoDB (Mongoose)
- JWT authentication
- Nodemailer

### Frontend
- Angular 16
- Bootstrap 5
- RxJS
- TypeScript

## 📖 Documentation

- [Deployment Guide](DEPLOYMENT.md) - Detailed deployment instructions
- [API Documentation](backend/README.md) - Backend API endpoints

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the ISC License.

## 🆘 Support

For deployment issues:
1. Check the [Deployment Guide](DEPLOYMENT.md)
2. Review Render logs
3. Verify environment variables
4. Ensure MongoDB is accessible 