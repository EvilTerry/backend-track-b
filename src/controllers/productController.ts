import { Request, Response, NextFunction } from 'express';
import { getDB } from '../database/database';

export const getProducts = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const db = await getDB();
        const { search, category } = req.query;

        let query = 'SELECT DISTINCT p.* FROM products p'

        const conditions: string[] = []
        const params: any[] = [];

        // Check category
        if (category) {
            query += `
                JOIN product_categories pc ON p.id = pc.product_id
                JOIN categories c ON pc.category_id = c.id
            `;
            conditions.push("c.name = ?");
            params.push(category);
        }

        // Check search
        if (search) {
            conditions.push("p.name LIKE ?");
            params.push(`%${search}%`);
        }

        // Add conditions
        if (conditions.length > 0) {
            query += " WHERE " + conditions.join(" AND ");
        }
        
        const products = await db.all(query, params);

        res.json({
            data: products
        });
    } catch (error) {
        next(error);
    }
};