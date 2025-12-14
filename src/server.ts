import express from 'express';
import { initDb } from './database/database';
import { errorHandler } from './middleware/errorHandler';
import productRoute from './routes/productRoute';

const app = express();
const PORT = 3000;

app.use(express.json());
app.use('/api', productRoute);

app.use(errorHandler);

initDb().then(() =>{
    app.listen(PORT, () => {
        console.log(`Server running at http://localhost:${PORT}`);
    });
});