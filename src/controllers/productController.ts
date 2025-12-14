import { Request, Response, NextFunction } from 'express';
import { getDB } from '../database/database';

export const getProducts = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const db = await getDB();
        
        const products = await db.all('SELECT * FROM products');

        res.json({
            data: products
        });
    } catch (error) {
        next(error);
    }
};