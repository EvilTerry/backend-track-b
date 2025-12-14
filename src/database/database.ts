import sqlite3 from 'sqlite3';
import { open, Database } from 'sqlite';
import fs from 'fs';
import path from 'path';

let dbInstance: Database | null = null;

export async function getDB() {
    if (dbInstance) return dbInstance;

    dbInstance = await open({
        filename: './database.db',
        driver: sqlite3.Database
    });

    return dbInstance;
}

export async function initDb() {
    const db = await getDB();

    try {
        await db.get('SELECT count(*) FROM products');
    } catch (e) {
        console.log('Seeding database..');
        const seedSql = fs.readFileSync(path.join(process.cwd(), 'seed.sql'), 'utf-8');

        await db.exec(seedSql);
        console.log('Database seeded')
    }
}